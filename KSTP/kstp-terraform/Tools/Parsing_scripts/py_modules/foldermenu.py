import os

class FolderBasedMenu():
    def __init__(self, questions, message='KSTP NSX Tool'):
        '''
            Folder based menu, 'questions' is a list of questions where the number of questions 
            define how many times the function will call itself.\n
            'questions' is a list of lists where each element have the following format: [question, True/False]\n
            True/False defines if it is to list only folders (True) or folders and files (False)
        '''
        self.message = message
        self.exclusions = ['.', '_vars', 'azure', 'azure-infra']
        self.quit = ['E', 'e']
        self.back = ['B', 'b']
        self.yes = ['Y', 'y']
        self.answers_list = []
        self.questions = questions
        self.last_question = len(questions) - 1     # Lists starts from 0
        self.error_msg = '' 
        self.keep_asking = True
        self.exited_status = False
        self.root = '' 
        
    # Properties
    def _get_answers(self):
        return self.answers_list
    
    def _get_error(self):
        return self.error_msg
    
    def _get_exited(self):
        return self.exited_status
    
    answers = property(
        fget = _get_answers
    )

    error = property(
        fget = _get_error
    )

    exited = property(
        fget = _get_exited
    )

    def Question(self, path, question_index=0):
        try:
            #if (self.keep_asking):
                # Set the root folder
                if (question_index == 0):
                    self.root = path
                if (os.name == 'nt'):
                    os.system('cls')
                else:
                    os.system('clear')
                print("   ____ _   _    _         _         _                        _   _                 ")
                print("  / ___| \ | |  / \       / \  _   _| |_ ___  _ __ ___   __ _| |_(_) ___  _ __  ___ ")
                print(" | |   |  \| | / _ \     / _ \| | | | __/ _ \| '_ ` _ \\ / _` | __| |/ _ \| '_ \/ __|")
                print(" | |___| |\  |/ ___ \   / ___ \ |_| | || (_) | | | | | | (_| | |_| | (_) | | | \__ \\")
                print("  \____|_| \_/_/   \_\ /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|___/ ")
                print(" ")
                print(" ")
                print(" {}".format('-'*len(self.message)))
                print(" {}".format(self.message))
                print(" {}".format('-'*len(self.message)))
                print(" ")
                print(" ")
                print(' {}'.format(self.questions[question_index][0]))
                print(' ')
                # Print the available options
                print (' E) Exit')
                if (question_index > 0):
                    print(' B) Back')
                print(' ')
                menu_options = []
                options = self.questions[question_index][2]
                if (options):
                    for i, option in enumerate(options):
                        print(' {}) {}'.format(i+1, option))
                        menu_options.append(option)
                else:
                    if (self.questions[question_index][1]):     #[1] True/False --> True list only folders
                        # List folder content
                        folders = os.scandir(path)
                        for folder in folders:
                            if (folder.is_dir() and (not folder.name in self.exclusions)):
                                menu_options.append(folder.name)
                    else:
                        names = os.listdir(path)
                        for name in names:
                            if (not name in self.exclusions):
                                menu_options.append(name)
                    # Sort the options
                    # menu_options.sort()
                    for i, option in enumerate(menu_options):
                        print(' {}) {}'.format(i+1, option))
                print(' ')
                choice = input(" Select an option: ")
                if (choice in self.quit):
                    #self.keep_asking = False
                    self.exited_status = True
                    return
                if (choice in self.back):
                    # Trying to go back in the first question, not possible.
                    if (question_index == 0):
                        self.Question(path, question_index)
                    else:
                        # Need to go back to the previous question
                        new_path = os.path.split(path)
                        new_index = question_index - 1
                        self.answers.pop()
                        self.Question(new_path[0], new_index)
                else:
                    if (choice.isdigit()):
                        choice = int(choice) - 1
                        if 0 <= choice <= len(menu_options)-1:
                            self.answers.append(menu_options[choice])
                            # Check if it was the last question
                            if (question_index == self.last_question):
                                # Last question, ask for confirmation
                                if (os.name == 'nt'):
                                    os.system('cls')
                                else:
                                    os.system('clear')
                                print("   ____ _   _    _         _         _                        _   _                 ")
                                print("  / ___| \ | |  / \       / \  _   _| |_ ___  _ __ ___   __ _| |_(_) ___  _ __  ___ ")
                                print(" | |   |  \| | / _ \     / _ \| | | | __/ _ \| '_ ` _ \\ / _` | __| |/ _ \| '_ \/ __|")
                                print(" | |___| |\  |/ ___ \   / ___ \ |_| | || (_) | | | | | | (_| | |_| | (_) | | | \__ \\")
                                print("  \____|_| \_/_/   \_\ /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|___/ ")
                                print(" ")
                                print(" ")
                                print(" {}".format('-'*len(self.message)))
                                print(" {}".format(self.message))
                                print(" {}".format('-'*len(self.message)))
                                print(" ")
                                print(" ")
                                print('These were the values selected: ')
                                print(' ')
                                print(' ')
                                for index, question in enumerate(self.questions):
                                    print('{}) {} {}'.format(index+1, question[0], self.answers[index]))
                                print(' ')
                                print(' ')
                                yes = input('Continue? (y/n): ')
                                if (yes in self.yes):
                                    #self.keep_asking = False
                                    return
                                else:   # Reset the questions
                                    path = self.root
                                    question_index = 0
                                    self.answers_list = []
                                    self.Question(path, question_index)
                            else:
                                new_path = '{}/{}'.format(path, menu_options[choice])
                                new_index = question_index + 1
                                self.Question(new_path, new_index)
                        else:
                            # Invalid option, ask again
                            self.Question(path, question_index)
                    else:
                        # Invalid option, ask again
                        self.Question(path, question_index)
        except Exception as ex:
            self.error_msg = ex
            #self.keep_asking = False