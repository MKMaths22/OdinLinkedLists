# OdinLinkedLists

Follows the TOP Linked List Assignment

This project uses the MIT License.

I decided to go for the Extra Credit, so have made LinkedList and Node classes both included in linked_list.rb along with a few 'test' comments at the bottom, which can be uncommented for testing the methods.

----------------------

Project instructions:

You will need two classes:

LinkedList class, which will represent the full list.

Node class, containing a #value method and a link to the #next_node, set both as nil by default.

Build the following methods in your linked list class:

#append(value) adds a new node containing value to the end of the list
#prepend(value) adds a new node containing value to the start of the list
#size returns the total number of nodes in the list
#head returns the first node in the list
#tail returns the last node in the list
#at(index) returns the node at the given index
#pop removes the last element from the list
#contains?(value) returns true if the passed in value is in the list and otherwise returns false.
#find(value) returns the index of the node containing value, or nil if not found.
#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil

Extra Credit

#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.

Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.

-------------------------

Motivational comments:

I decided to allow initializing of a linked list with an array of values. You still have the option of initializing an empty list (if no array supplied) and appending values to it.

Having felt comfortable with recursion in completing the Recursion project recently (May 2023), I felt more uncomfortable with blocks, having been introduced to them in the last few days. So I wrote the list_each_with_index method to help refactor other methods that iterate through the entire list.

Once I completed the Extra Credit methods, I realised that #pop, #append and #prepend were special cases of either #insert_at or #remove_at. I also added an extra #valid_index? method to make guard clauses more concise.


