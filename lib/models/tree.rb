
class Tree < ActiveRecord::Base

    has_many :favorites
    has_many :users, through: :favorites

    def self.tty_runner
        @@prompt = TTY::Prompt.new
        @@prompt
    end

    def self.all_trees
        tty_runner
    
    
        question = "Select a tree for more information."
        output = Tree.all.map(&:common_name)
        tree = @@prompt.select(question, output, per_page: 10)
    
        @@tree = Tree.find_by(common_name: tree)
        
        tree_info
    
        puts "Aren't these trees neat!"
        question = "Return to Main Menu?"
        output = %w(yes exit)
    
        response = @@prompt.select(question, output)
        
        if response == "yes"
            system "clear"
            Application.main_menu
        else
            abort("Thanks for using TreeFind!!!!!!!!!")
        end
    end

    def self.tree_info
        system "clear"
        puts "The #{@@tree.common_name} tree has the scientific name #{@@tree.sci_name}, and looks like this:"
        system("#{@@tree.tree_picture}")
        puts "The leaves look thusly:"
        system("#{@@tree.leaf_picture}")
    end
end
