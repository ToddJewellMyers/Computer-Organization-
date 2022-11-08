#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_QUESTION_SIZE 40

typedef struct QuestionNode {
	char question[MAX_QUESTION_SIZE];
	struct QuestionNode *left;
	struct QuestionNode *right;
} QuestionNode;

QuestionNode *createnode(char newquestion[MAX_QUESTION_SIZE]) {
	QuestionNode* newnode = malloc(sizeof(QuestionNode));
	if (newnode != NULL) {
		newnode->left = NULL;
		newnode->right = NULL;
		strcpy_s(newnode->question, MAX_QUESTION_SIZE-1, newquestion);
	}
	return newnode;
}

void deallocateTree(struct QuestionNode* root) {
	if (root == NULL) {
		return;
	}
	deallocateTree(root->left);
	deallocateTree(root->right);

	printf("Deleting question: ");
	printf(root->question);
	printf("\n");
	free(root);
}

int main() {
	
	printf("Is it a dog?\n > ");
	char answer[MAX_QUESTION_SIZE];
	gets(answer);

	if (strcmp(answer, "yes") == 0) {
		printf("I win!");
	}
	else
	{
		printf("I lose! What animal were you thinking of?\n > ");
		gets(answer);
		QuestionNode *newNode = createnode("Is it a %s?", answer);
		printf("Please give me a yes/no question that distinquishes between a dog and a %s.\n > ", answer);
		gets(answer);
		QuestionNode *root = createnode(answer);
		printf("Would the answer to this question be yes or no for a dog?\n > ");
		gets(answer);
		if (strcmp(answer, "yes") == 0) {
			root->left = createnode("Is it a dog?");
			root->right = newNode;
		}
		else
		{
			root->right = createnode("Is it a dog?");
			root->left = newNode;
		}

		printf("Thank you. Would you like to play again?\n > ");
		gets(answer);
		if (strcmp(answer, "no") == 0) {
			printf("Cleaning up:\n");
			deallocateTree(root);
			printf("Done.");
			return 0;
		}
		else {
			QuestionNode* current = root;
			//LOOP START
			while (1) {
				printf("%s\n > ", current->question);
				gets(answer);
				//USER ANSWERS YES, COMPUTER WINS
				if ((strcmp(answer, "yes") == 0) && (current->left == NULL)) {
					printf("I win!");
					printf("Cleaning up:\n");
					deallocateTree(root);
					printf("Done.");
					return 0;
				}
				//USER ANSWERS YES, NEXT QUESTION
				if ((strcmp(answer, "yes") == 0) && (!(current->left == NULL))) {
					current = root->left;
					continue;
				}
				//USER ANSWERS NO, COMPUTER GETS NEW QUESTION
				if ((strcmp(answer, "no") == 0) && (current->right == NULL)) {
					printf("I lose! What animal were you thinking of?\n > ");
					gets(answer);
					QuestionNode* newNode1 = createnode("Is it a %s?", answer);
					char userquestion[MAX_QUESTION_SIZE];
					printf("Please give me a yes/no question that distinquishes between the animal I guessed and a %s.\n > ", answer);
					gets(userquestion);

					printf("Would the answer to this question be yes or no for the animal I guessed?\n > ");
					gets(answer);
					if (strcmp(answer, "yes") == 0) {
						char lastquestion[MAX_QUESTION_SIZE];
						strcpy_s(lastquestion, MAX_QUESTION_SIZE - 1, current->question);
						strcpy_s(current->question, MAX_QUESTION_SIZE - 1, userquestion);
						current->left = createnode(lastquestion);
						current->right = newNode1;

						printf("Thank you. Would you like to play again?\n > ");
						gets(answer);
						if (strcmp(answer, "no") == 0) {
							printf("Cleaning up:\n");
							deallocateTree(root);
							printf("Done.");
							return 0;
						}
						else {
							current = root;
							continue;
						}
					}
					else {
						char lastquestion[MAX_QUESTION_SIZE];
						strcpy_s(lastquestion, MAX_QUESTION_SIZE - 1, current->question);
						strcpy_s(current->question, MAX_QUESTION_SIZE - 1, userquestion);
						current->left = newNode1;
						current->right = createnode(lastquestion);

						printf("Thank you. Would you like to play again?\n > ");
						gets(answer);
						if (strcmp(answer, "no") == 0) {
							printf("\nCleaning up:\n");
							deallocateTree(root);
							printf("Done.");
							return 0;
						}
						else {
							current = root;
							continue;
						}
					}
				}
				//USER ANSWERS NO, NEXT QUESTION
				if ((strcmp(answer, "no") == 0) && (!(current->right == NULL))) {
					current = root->right;
					continue;
				}
			}
		}
	}

	return 0;
}