class LinkedList {

    // Node class representing each element in the linked list
    static class Node {
        int data;
        Node next;

        Node(int data) {
            this.data = data;
            this.next = null;
        }
    }

    Node head; // Head of the list

    // Method to insert a new node at the end of the list
    public void insert(int data) {
        Node newNode = new Node(data);

        if (head == null) {
            head = newNode;
        } else {
            Node last = head;
            while (last.next != null) {
                last = last.next;
            }
            last.next = newNode;
        }
    }

    // Method to delete a node with a specific value
    public void delete(int data) {
        Node current = head;
        Node previous = null;

        // If the head node itself holds the key to be deleted
        if (current != null && current.data == data) {
            head = current.next; // Change head
            return;
        }

        // Search for the key to be deleted, keep track of the previous node
        while (current != null && current.data != data) {
            previous = current;
            current = current.next;
        }

        // If the key was not present in the linked list
        if (current == null) {
            return;
        }

        // Unlink the node from the linked list
        previous.next = current.next;
    }

    // Method to display the contents of the linked list
    public void display() {
        Node current = head;
        while (current != null) {
            System.out.print(current.data + " -> ");
            current = current.next;
        }
        System.out.println("null");
    }

    public static void main(String[] args) {
        LinkedList list = new LinkedList();

        // Inserting elements
        list.insert(10);
        list.insert(20);
        list.insert(30);
        list.insert(40);

        // Displaying the list
        System.out.print("Linked List: ");
        list.display();

        // Deleting an element
        list.delete(20);
        System.out.print("After deleting 20: ");
        list.display();
    }
}
