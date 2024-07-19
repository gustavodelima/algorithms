#!/bin/bash

declare -A node
declare -A next_pointer

head=""

function insert_at_head {
    local value=$1
    local new_head="node_$RANDOM"
    node[$new_head]=$value
    next_pointer[$new_head]=${head:-}
    head=$new_head
}

function traverse {
    local current=$head
    echo "Current List:"
    while [ -n "$current" ]; do
        echo -n "${node[$current]} "
        current=${next_pointer[$current]}
    done
    echo
}

function delete_value {
    local value=$1
    local current=$head
    local prev=""
    while [ -n "$current" ]; do
        if [ "${node[$current]}" == "$value" ]; then
            if [ -z "$prev" ]; then
                head=${next_pointer[$current]}
            else
                next_pointer[$prev]=${next_pointer[$current]}
            fi
            unset node[$current]
            unset next_pointer[$current]
            echo "Value $value deleted."
            return
        fi
        prev=$current
        current=${next_pointer[$current]}
    done
    echo "Value $value not found in list."
}

insert_at_head 10
insert_at_head 20
insert_at_head 30
traverse  
delete_value 20
traverse  
