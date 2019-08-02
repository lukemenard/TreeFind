require "tty-box"

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
            Application.application_runner
        else
            abort("Thanks for using TreeFind!!!!!!!!!")
        end
    end

    def self.tree_info
        system "clear"
          puts "The #{@@tree.common_name} tree has the scientific name #{@@tree.sci_name}, and looks like this:"
          system("#{@@tree.tree_picture}")
          puts ""
          puts ""
          puts "The leaves look thusly:"
          system("#{@@tree.leaf_picture}")
          puts ""
          puts ""
          puts "The tree's bark is #{@@tree.bark_texture} and the color of the bark is #{@@tree.bark_color}"
          puts ""
          puts "The #{@@tree.common_name} tree exists in #{@@tree.habitat} habitats between elevations of #{@@tree.min_elevation} and #{@@tree.max_elevation} feet!"
          puts ""
          puts "#{@@tree.common_name}s grow to heights of between #{@@tree.min_height} and #{@@tree.max_height} feet."
          puts ""
    end
end
