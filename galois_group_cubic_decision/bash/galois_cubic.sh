#!/usr/bin/env bash
set -euo pipefail

# galois_cubic_pure_sh.sh
# Example: ./galois_cubic.sh 1 0 -1 1
#
# Decide the Galois group of a cubic polynomial over Q:
#   P(x) = a*x^3 + b*x^2 + c*x + d,  with integer coefficients.
#
# Method (classical):
# 1) Check reducibility over Q using Rational Root Theorem:
#    If P has a rational root p/q (p|d, q|a), then reducible over Q.
#    For cubics: "no rational root"  <=>  irreducible over Q.
# 2) If irreducible, compute discriminant Δ:
#    Δ = b^2 c^2 - 4ac^3 - 4b^3 d - 27 a^2 d^2 + 18abcd
# 3) If Δ is a square in Q (for integer Δ: perfect square in Z), then Gal(P/Q) ≅ A3 ≅ C3,
#    else Gal(P/Q) ≅ S3.

usage() {
  echo "Usage: $0 a b c d"
  echo "Example: $0 1 0 -1 1   # x^3 - x + 1"
}

if [ $# -ne 4 ]; then
  usage
  exit 1
fi

a="$1"; b="$2"; c="$3"; d="$4"

if [ "$a" -eq 0 ]; then
  echo "Error: a must be nonzero (this script is for cubics)."
  exit 1
fi

abs() { local x="$1"; (( x < 0 )) && echo $(( -x )) || echo "$x"; }

gcd() {
  local x; x="$(abs "$1")"
  local y; y="$(abs "$2")"
  while (( y != 0 )); do
    local t=$(( x % y ))
    x="$y"
    y="$t"
  done
  echo "$x"
}

# Integer sqrt floor for nonnegative n (64-bit safe if n fits in bash arithmetic).
isqrt() {
  local n="$1"
  if (( n < 0 )); then
    echo "0"
    return
  fi
  local lo=0
  local hi=1

  # Increase hi until hi^2 > n
  while (( hi <= 3037000499 && hi*hi <= n )); do
    hi=$(( hi * 2 ))
  done
  if (( hi > 3037000499 )); then
    hi=3037000499
  fi

  # Binary search in [lo, hi)
  while (( lo + 1 < hi )); do
    local mid=$(( (lo + hi) / 2 ))
    if (( mid*mid <= n )); then
      lo="$mid"
    else
      hi="$mid"
    fi
  done
  echo "$lo"
}

is_perfect_square() {
  local n="$1"
  if (( n < 0 )); then
    return 1
  fi
  local r; r="$(isqrt "$n")"
  (( r*r == n ))
}

# List positive divisors of |n| (for n=0, special-case: only 0 divides 0, but rational root theorem uses p|d).
divisors_pos() {
  local n; n="$(abs "$1")"
  if (( n == 0 )); then
    # We'll treat "divisors of 0" as just "0" for our root search convenience
    echo "0"
    return
  fi

  local i=1
  local r; r="$(isqrt "$n")"
  local out=()
  while (( i <= r )); do
    if (( n % i == 0 )); then
      out+=("$i")
      local j=$(( n / i ))
      if (( j != i )); then
        out+=("$j")
      fi
    fi
    i=$(( i + 1 ))
  done
  printf "%s\n" "${out[@]}"
}

# Evaluate P(p/q) using integer arithmetic:
# P(p/q) = (a*p^3 + b*p^2*q + c*p*q^2 + d*q^3) / q^3
# So root <=> numerator == 0.
is_rational_root() {
  local p="$1"
  local q="$2"

  # Reduce p/q just to keep numbers smaller
  local g; g="$(gcd "$p" "$q")"
  p=$(( p / g ))
  q=$(( q / g ))
  if (( q < 0 )); then
    q=$(( -q ))
    p=$(( -p ))
  fi

  # Compute numerator with bash int arithmetic
  # Beware overflow if coefficients are huge.
  local p2=$(( p*p ))
  local p3=$(( p2*p ))
  local q2=$(( q*q ))
  local q3=$(( q2*q ))

  local term1=$(( a*p3 ))
  local term2=$(( b*p2*q ))
  local term3=$(( c*p*q2 ))
  local term4=$(( d*q3 ))

  local num=$(( term1 + term2 + term3 + term4 ))
  (( num == 0 ))
}

echo "Polynomial: ${a}*x^3 + ${b}*x^2 + ${c}*x + ${d}"

# ------------------------------------------------------------
# Step 1: Reducibility over Q (Rational Root Theorem)
# ------------------------------------------------------------
echo "Checking for rational roots (Rational Root Theorem)..."

found_root=0
root_repr=""

# Candidate p divides d; candidate q divides a.
# If d == 0, then x=0 is a rational root immediately (p=0, q=1).
if (( d == 0 )); then
  if is_rational_root 0 1; then
    found_root=1
    root_repr="0"
  fi
fi

if (( found_root == 0 )); then
  mapfile -t P_DIVS < <(divisors_pos "$d")
  mapfile -t Q_DIVS < <(divisors_pos "$a")

  for p_abs in "${P_DIVS[@]}"; do
    for q_abs in "${Q_DIVS[@]}"; do
      # Skip invalid q=0 (can only happen if a==0 which we disallowed)
      if (( q_abs == 0 )); then
        continue
      fi

      # Try ±p/±q (sign only matters in p)
      for sign in 1 -1; do
        p=$(( sign * p_abs ))
        q="$q_abs"
        if is_rational_root "$p" "$q"; then
          found_root=1
          # Reduce representation
          g="$(gcd "$p" "$q")"
          p_red=$(( p / g ))
          q_red=$(( q / g ))
          if (( q_red < 0 )); then
            q_red=$(( -q_red ))
            p_red=$(( -p_red ))
          fi
          if (( q_red == 1 )); then
            root_repr="${p_red}"
          else
            root_repr="${p_red}/${q_red}"
          fi
          break 3
        fi
      done
    done
  done
fi

if (( found_root == 1 )); then
  echo "Reducible over Q: found rational root x = ${root_repr}"
  echo "Therefore this is NOT the generic irreducible-cubic case (S3 vs A3)."
  exit 0
fi

echo "No rational root found -> irreducible over Q (for cubics)."

# ------------------------------------------------------------
# Step 2: Discriminant
# Δ = b^2 c^2 - 4ac^3 - 4b^3 d - 27 a^2 d^2 + 18abcd
# ------------------------------------------------------------
echo "Computing discriminant..."

b2=$(( b*b ))
c2=$(( c*c ))
c3=$(( c2*c ))
b3=$(( b2*b ))
a2=$(( a*a ))
d2=$(( d*d ))

termA=$(( b2*c2 ))
termB=$(( 4*a*c3 ))
termC=$(( 4*b3*d ))
termD=$(( 27*a2*d2 ))
termE=$(( 18*a*b*c*d ))

Delta=$(( termA - termB - termC - termD + termE ))

echo "Discriminant Δ = ${Delta}"

# ------------------------------------------------------------
# Step 3: Square test -> Galois group
# ------------------------------------------------------------
if is_perfect_square "$Delta"; then
  echo "Δ is a perfect square in Z (hence a square in Q)."
  echo "For an irreducible cubic: Gal(P/Q) ≅ A3 ≅ C3."
else
  echo "Δ is NOT a perfect square in Z (hence not a square in Q)."
  echo "For an irreducible cubic: Gal(P/Q) ≅ S3."
fi

