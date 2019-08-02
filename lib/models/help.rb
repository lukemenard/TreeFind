# require_relative "./models/favorite.rb"
class Help
  # system "clear"

  def self.tty_runner
    @@prompt = TTY::Prompt.new
    @@prompt
  end

  def self.main_menu_help
    tty_runner
    puts ""
    puts ""
    puts "
    Step 1: Login
        •	Create a new username if you’re new to TreeFind
        •	If you’ve used TreeFind, you can select your username from a list of previous users

    Step 2: Choose what you want to do
    From the TreeFind main menu, you can do any of the following:
        •	Identify a tree
        •	See a list of all trees available in the TreeFind database
        •	Add a tree to your personal list of favorites
        •	See your personal list of favorite trees
        •	Learn how to use the app
        •	User settings

    Step 3:  Identify a tree
        1.	Answer a series of questions about your tree to narrow the list of available trees
        2.	See all trees from the database that meet the criteria you entered
        3.	Save any of the identified trees to your personal list of favorites

    Step 4: See a list of all trees available in the TreeFind database
        1.	Scroll through a list of all trees available in the TreeFind database
        2.	Select a tree from the list
        3.	See additional information and characteristics about the selected tree

    Step 5: Add a tree to your personal list of favorites
        1.	Scroll through a list of all trees available in the TreeFind database
        2.	Select a tree from the list
        3.	This tree is added to your personal list of favorite trees

    Step 6: See your personal list of favorite trees
        1.	Outputs a list of all the trees your saved to your favorites via Step 5

    Step 7: Learn how to use the app
        1.	Outputs instructions and information on how to use TreeFind
        
    Step 8: User settings
        1.	Edit user name allows a user to change their user name.
        2.      Delete user deletes user account and all favorited trees."

    question = "Return to Main Menu?"
    output = %w(yes exit)

    response = @@prompt.select(question, output)

    if response == "yes"
        system "clear"
        Application.application_runner
    else
        abort("Thanks for using TreeFind!!!!!!!!!")
    end
  end
end
