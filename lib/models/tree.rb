
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
    
        @@tree = Tree.find_by(user_name: tree)
        
        # puts all.pluck(:common_name)
    
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
end
