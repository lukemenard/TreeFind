class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :tree

    def self.tty_runner
        @@prompt = TTY::Prompt.new
        @@prompt
    end

    def self.select_tree

        tty_runner

        trees = Tree.all.map{ |tree|[tree.common_name, tree.common_name]}.to_h

        question = "What tree do you want to add to your favorites?"
        puts " "
        response = @@prompt.select(question, trees)
        response

    end

    def self.add_to_favorites
        response = select_tree
        user = Application.return_username
        tree = Tree.find_by(common_name: response)
        create(user:user, tree:tree)
        system "clear"
        Application.application_runner
    end

    def self.add_to_favorites_from_list(response)
      user = Application.return_username
      tree = Tree.find_by(common_name: response)
      create(user:user, tree:tree)
      system "clear"
      Application.application_runner
    end



    def self.show_favorites
       tty_runner
        user = Application.return_username
        user_id = user.id
        puts " "
        puts Tree.joins(:users).select("trees.*, favorites.*, users.*").where("users.id = ?", user_id).pluck(:common_name).uniq
        puts " "
        puts " "
        puts "Aren't these trees neat!"
        puts " "
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
