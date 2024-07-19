package main

import "fmt"

// Node represents an element of a linked list
type Node struct {
	Value int
	Next  *Node
}

// LinkedList holds the head of the list
type LinkedList struct {
	Head *Node
}

// Insert adds a new node with the given value at the end of the list
func (ll *LinkedList) Insert(value int) {
	newNode := &Node{Value: value}
	if ll.Head == nil {
		ll.Head = newNode
		return
	}
	current := ll.Head
	for current.Next != nil {
		current = current.Next
	}
	current.Next = newNode
}

// Delete removes the node with the given value from the list
func (ll *LinkedList) Delete(value int) {
	if ll.Head == nil {
		return
	}
	if ll.Head.Value == value {
		ll.Head = ll.Head.Next
		return
	}
	current := ll.Head
	for current.Next != nil {
		if current.Next.Value == value {
			current.Next = current.Next.Next
			return
		}
		current = current.Next
	}
}

// Display prints all values in the list
func (ll *LinkedList) Display() {
	current := ll.Head
	for current != nil {
		fmt.Print(current.Value, " ")
		current = current.Next
	}
	fmt.Println()
}

func main() {
	ll := LinkedList{}
	ll.Insert(1)
	ll.Insert(2)
	ll.Insert(3)
	ll.Display() // Outputs: 1 2 3

	ll.Delete(2)
	ll.Display() // Outputs: 1 3
}
