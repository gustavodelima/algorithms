#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int data;
    struct node* next;
} Node;

// Function to create a new node
Node* createNode(int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    if (newNode == NULL) {
        printf("Error creating a new node.\n");
        exit(0);
    }
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// Function to insert a node at the beginning of the linked list
void insertAtBeginning(Node** head, int data) {
    Node* newNode = createNode(data);
    newNode->next = *head;
    *head = newNode;
}

// Function to insert a node at the end of the linked list
void insertAtEnd(Node** head, int data) {
    Node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
        return;
    }
    Node* last = *head;
    while (last->next != NULL) {
        last = last->next;
    }
    last->next = newNode;
}

// Function to delete a node from the linked list by key
void deleteNodeByKey(Node** head, int key) {
    Node *temp = *head, *prev = NULL;

    if (temp != NULL && temp->data == key) {
        *head = temp->next;
        free(temp);
        return;
    }

    while (temp != NULL && temp->data != key) {
        prev = temp;
        temp = temp->next;
    }

    if (temp == NULL) return;

    prev->next = temp->next;
    free(temp);
}

// Function to print the linked list
void printList(Node* node) {
    while (node != NULL) {
        printf("%d -> ", node->data);
        node = node->next;
    }
    printf("NULL\n");
}

// Main function to demonstrate linked list operations
int main() {
    Node* head = NULL;  // Start with an empty list

    insertAtBeginning(&head, 10);  // List: 10
    insertAtBeginning(&head, 20);  // List: 20 -> 10
    insertAtEnd(&head, 30);        // List: 20 -> 10 -> 30
    insertAtEnd(&head, 40);        // List: 20 -> 10 -> 30 -> 40
    printList(head);               // Should display: 20 -> 10 -> 30 -> 40 -> NULL

    deleteNodeByKey(&head, 20);    // List: 10 -> 30 -> 40
    printList(head);               // Should display: 10 -> 30 -> 40 -> NULL

    return 0;
}
