

$$$$$$$$\                            $$$$$$$$\ $$\                 $$\
\__$$  __|                           $$  _____|\__|                $$ |
   $$ | $$$$$$\   $$$$$$\   $$$$$$\  $$ |      $$\ $$$$$$$\   $$$$$$$ |
   $$ |$$  __$$\ $$  __$$\ $$  __$$\ $$$$$\    $$ |$$  __$$\ $$  __$$ |
   $$ |$$ |  \__|$$$$$$$$ |$$$$$$$$ |$$  __|   $$ |$$ |  $$ |$$ /  $$ |
   $$ |$$ |      $$   ____|$$   ____|$$ |      $$ |$$ |  $$ |$$ |  $$ |
   $$ |$$ |      \$$$$$$$\ \$$$$$$$\ $$ |      $$ |$$ |  $$ |\$$$$$$$ |
   \__|\__|       \_______| \_______|\__|      \__|\__|  \__| \_______|


TreeFind is a tool that serves several tree-related functions!

__________________________________________________Installation________________________________________________________

Step 1: Install NPM and Node
    •	https://www.npmjs.com/get-npm
    •	Click "Download Node.js and npm"
    •	In your terminal, use  'node -v' and 'npm -v' to verify it worked and you have the current version

Step 2: Install ITerm2
    •	https://www.iterm2.com/click
    •	Click "Download" at the bottom of the screen
    •	Follow the on-screen instructions

Step 3: Install imgcat-cli
    •	In ITerm2 enter, 'npm install -g imgcat-cli'
    •	See https://github.com/egoist/imgcat-cli for more information.

Step 4: Install Ruby:
    • Check if Ruby is installed by entering "ruby -v" in ITerm2 (or in your terminal)
    •	If installed, you will see a version such as "ruby 2.6.1p33"
    •	If not installed, see https://www.ruby-lang.org/en/documentation/installation/ for installation instructions

Step 5: Clone the project onto your device and navigate you working directory to the cloned TreeFind_Final folder

Step 6: Run "bundle install" from ITerm2 (or from your terminal) to install required ruby gems

Step 7: Set up the database
    •	use 'rake db:migrate'
    •	*Seed* the database with existing tree data using 'rake db:seed'

Step 8: Run the program from ITerm2
    • In the file "config/environment.rb", confirm that "app" on line 17 is not hashed out
    • Run "ruby config/environment.rb" from ITerm2


__________________________________________________Using TreeFind________________________________________________________

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

Step 3:  Identify a tree
    1.	Answer a series of questions about your tree to narrow the list of available trees
    2.	See all trees from the database that meet the criteria you entered
    3.	Save any of the identified trees to your personal list of favorites

    An example workflow for navigating this feature of TreeFind is as follows:
    ![Unsplash workflow](https://github.com/lukemenard/TreeFind_Final/blob/master/lib/pic/Tree%20ID%20CLI%20Project%20Workflow.png)

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

__________________________________________________Limitations and Next Steps________________________________________________________

This tool was constructed as a coding exercise by students at the Flatiron School. As a result:
    1. Data may not be scientifically accurate
    2. TreeFind may not identify a tree species with precision
    3. Current code base may not be fully refactored/cleaned
Next Steps: draw exclusively from a scientifically/peer-reviewed repository of tree data, if one exists. Streamline and refactor code base

TreeFind seeds from a constructed list of 20 common Colorado trees. As a result:
    1. This tool should not be used outside of Colorado
    2. The functionality of the "identify a tree function" is very limited in scope
Next Steps: call to an API that contains a large collection of tree phenological/ecological data and tailor questions in the workflow to available data
