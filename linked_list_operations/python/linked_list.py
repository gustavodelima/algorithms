class ListNode:
    """ A node in a singly linked list. """
    def __init__(self, value=0, next=None):
        self.value = value
        self.next = next

class LinkedList:
    """ A singly linked list. """
    def __init__(self):
        self.head = None

    def append(self, value):
        """ Append a new node with the given value to the end of the list. """
        if not self.head:
            self.head = ListNode(value)
        else:
            current = self.head
            while current.next:
                current = current.next
            current.next = ListNode(value)

    def insert(self, value, position):
        """ Insert a new node with the given value at the given position. """
        new_node = ListNode(value)
        if position == 0:
            new_node.next = self.head
            self.head = new_node
        else:
            current = self.head
            for _ in range(position - 1):
                if current is None:
                    raise IndexError("Position out of bounds")
                current = current.next
            new_node.next = current.next
            current.next = new_node

    def delete(self, value):
        """ Delete the first node containing the given value. """
        current = self.head
        previous = None
        while current and current.value != value:
            previous = current
            current = current.next
        if current is None:
            return False
        if previous is None:
            self.head = current.next
        else:
            previous.next = current.next
        return True

    def find(self, value):
        """ Find the node containing the given value. """
        current = self.head
        while current:
            if current.value == value:
                return True
            current = current.next
        return False

    def display(self):
        """ Display all the values in the list. """
        elements = []
        current = self.head
        while current:
            elements.append(current.value)
            current = current.next
        return elements

# Usage
if __name__ == '__main__':
    ll = LinkedList()
    ll.append(10)
    ll.append(20)
    ll.append(30)
    ll.insert(15, 1)  # Insert 15 after the first element
    print("After inserting 15 at position 1:", ll.display())

    ll.delete(20)  # Delete the first occurrence of 20
    print("After deleting 20:", ll.display())

    exists = ll.find(15)
    print("Exists 15:", exists)

    print("Final List:", ll.display())
