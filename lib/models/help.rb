# require_relative "./models/favorite.rb"
class Help
  # system "clear"

  def self.tty_runner
    @@prompt = TTY::Prompt.new
    @@prompt
  end

  def self.main_menu_help
    tty_runner
    puts "poop"
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
