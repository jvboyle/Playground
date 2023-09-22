import sys
import argparse

class AppArgs():
    def __init__(self, summary, args):
        # Initialize the class and set the arguments that should be used by the script
        # 
        # summary: a brief description about the script, it will be displayed with -h
        # args...: a list of arguments with the following format ["<arg>", "<arg description>", "<required: True|False>"]
        #
        # Example:
        # 
        # import getargs.py
        #
        # myParser = AppArgs("This is a parser", [
        #   ["-p1", "param1 is used to bla bla bla", True],
        #   ["-p2", "param2 is used to bla bla bla", False],
        #   [ .... param N ....],
        # ])
        #
        try:
            parser = argparse.ArgumentParser(
                description = summary,
                epilog = "---- copyright Kyndryl Service Technology Platform ----"
            )
            for arg in args:
                # arg[0] - argument, like -v
                # arg[1] - argument help message
                # arg[2] - True | False, to set if the argument is required or not
                # arg[3] - Action
                parser.add_argument(arg[0], help=arg[1], required=arg[2], action=arg[3])
            self.args = parser.parse_args()
            self.parser = parser
        except argparse.ArgumentError:
            self.gethelp()
            sys.exit(0)
        except BaseException as be:
            # ParseArg may raise a SystemExit(2) due to a wrong argument provided.
            # SystemExit() are not part of the Exception class, but from the BaseException class, and
            # this part of the code is just to handle those exceptions in an interactive mode session
            # i.e. running within VCode
            print(be.__doc__)
            sys.exit(0)

    def gethelp(self):
        # It will print the help/usage message when the -h is passed, such as:
        #
        # usage: getargs.py [-h] -a A -b B -c C
        # This is the "summary" message provided during to the class constructor
        # 
        # -h, --help  show this help message and exit
        # -a A        help a
        # -b B        help b
        # -c C        help c
        # 
        # ---- copyright Kyndryl Service Technology Platform ----
        #
        self.parser.print_help()

    def getargs(self):
        # It will return a dictionary with all arguments provided
        return vars(self.args)

