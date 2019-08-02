require "tty-prompt"
require "pry"

class Question

  def self.tty_runner
    @@prompt = TTY::Prompt.new
    @@prompt
  end


# ____________Question_1___________________________


  def self.question_one
    system "clear"
    tty_runner

    puts "Conifers are trees with cones and needle-like or scale-like leaves that are typically evergreen (retain their leaves throughout the year)."
    puts "Pines and firs are conifers, for example."
    system("imgcat ./lib/pic/Ponderosa-Leaftall-225x300.jpg")
    puts ""
    puts "Deciduous trees lose their leaves annually."
    puts "Maples and oaks are deciduous trees."
    system("imgcat ./lib/pic/Plains-Cotton-Leaf.jpg")
    puts ""
    question = "Is your tree coniferous or deciduous?"
    output = {
      "My tree is coniferous." => 1,
      "My tree is deciduous." => 2,
      "Return to Main Menu." => 3
    }

    response = @@prompt.select(question, output).to_i
    case response
    when 1
      @@type = "Coniferous"
    when 2
      @@type = "Deciduous"
    end
    response
  end


#__________________CONIFERS_______________________________

# ____________Question_2_Conifer_Needle-Arrangement___________________________

  def self.question_two_conifer
    system "clear"
    tty_runner

    tree_count = Tree.all.where("coniferous_deciduous = ?", @@type).count
    tree_list = Tree.all.where("coniferous_deciduous = ?", @@type).pluck(:common_name)

    puts "Your tree is a conifer! There are #{tree_count} available conifers."
    puts ""
    puts "The way a conifer's needles are arranged can help you identify the species."
    puts "A conifer can have individual or clustered needles, called fasciles."
    system("imgcat ./lib/pic/question_two_conifer/fascicle2.jpg")
    system ("imgcat ./lib/pic/question_two_conifer/fascicle5.jpg")
    puts ""
    puts "Needles can also be flat,"
    system ("imgcat ./lib/pic/question_two_conifer/flat_needle.jpg")
    puts ""
    puts "sharp,"
    system ("imgcat ./lib/pic/question_two_conifer/needle_sharp.jpg")
    puts ""
    puts "or scaled."
    system ("imgcat ./lib/pic/question_two_conifer/needle_scaled.jpg")
    puts ""
    question = "What needle arrangement does your tree have?"
    output = {
      "Needles are in clusters of 2-3."  => 1,
      "Needles are in clusters of 5." => 2,
      "Needles are flat." => 3,
      "Needles are sharp." => 4,
      "Needles are scaled." => 5,
      "See a list of #{tree_count} remaining trees." => 6,
      "If there are no remaining trees, return to the main menu." => 7
    }
    response = @@prompt.select(question, output, per_page: 7)
    case response
    when 1
      @@needles = "Clusters of 2-3"
    when 2
      @@needles = "Clusters of 5"
    when 3
      @@needles = "Flat"
    when 4
      @@needles = "Sharp"
    when 5
      @@needles = "Scaled"
    when 6

      question = "Do you want to save a tree to your favorites?"
      output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

      response = @@prompt.select(question, output, per_page:15)

      if response == "Return to Main Menu."
          system "clear"
          Application.application_runner
      elsif response == "No. Return to the question."
          system "clear"
          question_three_conifer
      else
        Favorite.add_to_favorites_from_list(response)
      end
    when 7
      Application.application_runner
    end
    response
  end


# ____________Question_3_Conifer_Cones___________________________

def self.question_three_conifer
  system "clear"
  tty_runner

  tree_count = Tree.all.where("coniferous_deciduous = ?", @@type).where("needle_shape = ?", @@needles).count
  tree_list = Tree.all.where("coniferous_deciduous = ?", @@type).where("needle_shape = ?", @@needles).pluck(:common_name)

  puts "Your needles are #{@@needles}! There are #{tree_count} trees available."
  puts ""
  puts "A conifer's 'fruit' can be a woody or papery cone, or the tree can have berries."
  puts ""
  question = "What kind of cones does your tree have?"
  output = {
    "Cones are woody." => 1,
    "Cones are papery." => 2,
    "The tree has berries." => 3,
    "See a list of #{tree_count} remaining trees." => 4,
    "If there are no remaining trees, return to the main menu." => 5
  }
  response = @@prompt.select(question, output).to_i
  case response
  when 1
    @@cones = "Woody"
  when 2
    @@cones = "Papery"
  when 3
    @@cones = "Berry"
  when 4

    question = "Do you want to save a tree to your favorites?"
    output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

    response = @@prompt.select(question, output, per_page:15)

    if response == "Return to Main Menu."
        system "clear"
        Application.application_runner
    elsif response == "No. Return to the question."
        system "clear"
        question_three_conifer
    else
      Favorite.add_to_favorites_from_list(response)
    end
  when 5
    Application.application_runner
  end
  response
end


# ____________Question_4_Conifer_Bark-Texture___________________________

def self.question_four_conifer
  system "clear"
  tty_runner

  tree_count = Tree.all.where("coniferous_deciduous = ?", @@type).where("needle_shape = ?", @@needles).where("cone_type = ?", @@cones).count
  tree_list = Tree.all.where("coniferous_deciduous = ?", @@type).where("needle_shape = ?", @@needles).where("cone_type = ?", @@cones).pluck(:common_name)

  puts "Your cones are #{@@cones}! There are #{tree_count} trees available."
  puts ""
  puts "A tree's bark can be very distinctive. Bark can be smooth or bumpy, be furrowed with deep ridges, have scales, or be peeling and papery."
  puts ""
  question = "What kind of bark does your tree have?"
  output = {
    "Bark is smooth." => 1,
    "Bark is bumpy." => 2,
    "Bark is furrowed." => 3,
    "Bark is scaled." => 4,
    "Bark is peeling." => 5,
    "See a list of #{tree_count} remaining trees." => 6,
    "If there are no remaining trees, return to the main menu." => 7
  }
  response = @@prompt.select(question, output, per_page: 7).to_i
  case response
  when 1
    @@bark_texture = "Smooth"
  when 2
    @@bark_texture = "Bumpy"
  when 3
    @@bark_texture = "Furrowed"
  when 4
    @@bark_texture = "Scaled"
  when 5
    @@bark_texture = "Peeling"
  when 6

    question = "Do you want to save a tree to your favorites?"
    output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

    response = @@prompt.select(question, output, per_page:15)

    if response == "Return to Main Menu."
        system "clear"
        Application.application_runner
    elsif response == "No. Return to the question."
        system "clear"
        question_three_conifer
    else
      Favorite.add_to_favorites_from_list(response)
    end
  when 7
    Application.application_runner
  end
  response
end

# ____________Question_5_Conifer_Bark-Color___________________________

def self.question_five_conifer
  system "clear"
  tty_runner

  tree_count = Tree.all.where("coniferous_deciduous = ?", @@type).where("needle_shape = ?", @@needles).where("cone_type = ?", @@cones).where("bark_texture = ?", @@bark_texture).count
  tree_list = Tree.all.where("coniferous_deciduous = ?", @@type).where("needle_shape = ?", @@needles).where("cone_type = ?", @@cones).where("bark_texture = ?", @@bark_texture).pluck(:common_name)

  puts "Your bark is #{@@bark_texture}! There are #{tree_count} trees available."
  puts "The color of tree bark also varies broadly."
  question = "What color bark does your tree have?"
  output = {
    "Bark is brown." => 1,
    "Bark is gray-brown." => 2,
    "Bark is gray." => 3,
    "Bark is red-brown." => 4,
    "See a list of #{tree_count} remaining trees." => 5,
    "If there are no remaining trees, return to the main menu." => 6
  }
  response = @@prompt.select(question, output).to_i
  case response
  when 1
    @@bark_color = "brown"
  when 2
    @@bark_color = "gray-brown"
  when 3
    @@bark_color = "gray"
  when 4
    @@bark_color = "red-brown"
  when 5

    question = "Do you want to save a tree to your favorites?"
    output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

    response = @@prompt.select(question, output, per_page:15)

    if response == "Return to Main Menu."
        system "clear"
        Application.application_runner
    elsif response == "No. Return to the question."
        system "clear"
        question_three_conifer
    else
      Favorite.add_to_favorites_from_list(response)
    end
  when 6
    Application.application_runner
  end
  response
end

# ____________Question_6_Conifer_Twigs___________________________

def self.question_six_conifer
  system "clear"
  tty_runner

  tree_count = Tree.all.where("coniferous_deciduous = ?", @@type).where("needle_shape = ?", @@needles).where("cone_type = ?", @@cones).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).count
  tree_list = Tree.all.where("coniferous_deciduous = ?", @@type).where("needle_shape = ?", @@needles).where("cone_type = ?", @@cones).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).pluck(:common_name)

  puts "Your bark is #{@@bark_color}! There are #{tree_count} trees available."
  question = "What texture are the tree's twigs?"
  output = {
    "Twigs are smooth." => 1,
    "Twigs are hairy." => 2,
    "Twigs are rough." => 3,
    "Twigs are peeling." => 4,
    "Twigs are thorny." => 5,
    "Twigs are sticky." => 6,
    "See a list of #{tree_count} remaining trees." => 7,
    "If there are no remaining trees, return to the main menu." => 8
  }
  response = @@prompt.select(question, output, per_page: 8).to_i
  case response
  when 1
    @@twigs = "Smooth"
  when 2
    @@twigs = "Hairy"
  when 3
    @@twigs = "Rough"
  when 4
    @@twigs = "Peeling"
  when 5
    @@twigs = "Thorny"
  when 6
    @@twigs = "Sticky"
  when 7

    question = "Do you want to save a tree to your favorites?"
    output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

    response = @@prompt.select(question, output, per_page:15)

    if response == "Return to Main Menu."
        system "clear"
        Application.application_runner
    elsif response == "No. Return to the question."
        system "clear"
        question_three_conifer
    else
      Favorite.add_to_favorites_from_list(response)
    end
  when 8
    Application.application_runner
  end
  response
  tree_list = Tree.all.where("coniferous_deciduous = ?", @@type).where("needle_shape = ?", @@needles).where("cone_type = ?", @@cones).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).where("twig_texture = ?", @@twigs).pluck(:common_name)
  puts tree_list

  question = "You've reached the end. Add the tree to your favorites?"
  output = [tree_list, "Return to main menu", "Exit"]

  response = @@prompt.select(question, output)

  if response == "Return to main menu"
      system "clear"
      Application.application_runner
  elsif response == "Exit"
      abort("Thanks for using TreeFind!!!!!!!!!")
  else
    Favorite.add_to_favorites_from_list(response)
  end
end




#__________________Deciduous_______________________________

# ____________Question_2_Deciduous_Leaf-Arrangement___________________________

  def self.question_two_deciduous
    system "clear"
    tty_runner

    tree_count = Tree.all.where("coniferous_deciduous = 'Deciduous'").count
    tree_list = Tree.all.where("coniferous_deciduous = 'Deciduous'").pluck(:common_name)

    puts "Your tree is deciduous! There #{tree_count} available deciduous trees."
    puts ""
    puts "The way a tree's leaves are arranged can help you identify the species."
    puts ""
    question = "What leaf arrangement does your tree have?"
    output = {
      "Leaves are opposite." => 1,
      "Leaves are alternate." => 2,
      "Leaves are whorled." => 3,
      "Leaves are basal." => 4,
      "See a list of #{tree_count} remaining trees." => 5,
      "If there are no remaining trees, return to the main menu." => 6
    }
    response = @@prompt.select(question, output).to_i
    case response
    when 1
      @@leaves = "Opposite"
    when 2
      @@leaves = "Alternate"
    when 3
      @@leaves = "Whorled"
    when 4
      @@leaves = "Basal"
    when 5

      question = "Do you want to save a tree to your favorites?"
      output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

      response = @@prompt.select(question, output, per_page:15)

      if response == "Return to Main Menu."
          system "clear"
          Application.application_runner
      elsif response == "No. Return to the question."
          system "clear"
          question_three_conifer
      else
        Favorite.add_to_favorites_from_list(response)
      end
    when 6
      Application.application_runner
    end
    response
  end

  # ____________Question_3_Deciduous_Leaf-Shape___________________________

  def self.question_three_deciduous
    system "clear"
    tty_runner

    tree_count = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).count
    tree_list = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).pluck(:common_name)

    puts "Your leaves are #{@@leaves}! There #{tree_count} trees available."
    puts "The shape of a leaf can also be very distinctive."
    question =  "What shape are your leaves?"
    output = {
      "Leaves are pinnate." => 1,
      "Leaves are narrow." => 2,
      "Leaves are deltoid." => 3,
      "Leaves are orbicular." => 4,
      "Leaves are oblanceolate." => 5,
      "Leaves are palmate." => 6,
      "Leaves are lobed." => 7,
      "See a list of #{tree_count} remaining trees." => 8,
      "If there are no remaining trees, return to the main menu." => 9
    }
    response = @@prompt.select(question, output,  per_page: 9).to_i
    case response
    when 1
      @@leaf_shape = "Pinnate"
    when 2
      @@leaf_shape = "Narrow"
    when 3
      @@leaf_shape = "Deltoid"
    when 4
      @@leaf_shape = "Orbicular"
    when 5
      @@leaf_shape = "Oblanceolate"
    when 6
      @@leaf_shape = "Palmate"
    when 7
      @@leaf_shape = "Lobed"
    when 8

      question = "Do you want to save a tree to your favorites?"
      output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

      response = @@prompt.select(question, output, per_page:15)

      if response == "Return to Main Menu."
          system "clear"
          Application.application_runner
      elsif response == "No. Return to the question."
          system "clear"
          question_three_conifer
      else
        Favorite.add_to_favorites_from_list(response)
      end
    when 9
      Application.application_runner
    end
    response
  end

  # ____________Question_4_Deciduous_Bark-Texture___________________________

  def self.question_four_deciduous
    system "clear"
    tty_runner

    tree_count = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).count
    tree_list = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).pluck(:common_name)

    puts "Your leaves are #{@@leaf_shape}! There are #{tree_count} trees available."
    puts "A tree's bark can be very distinctive."
    puts "Bark can be smooth or bumpy, be furrowed with deep ridges, have scales, or be peeling and papery."
    question =  "What kind of bark does your tree have?"
    output = {
      "Bark is smooth." => 1,
      "Bark is bumpy." => 2,
      "Bark is furrowed." => 3,
      "Bark is scaled." => 4,
      "Bark is peeling." => 5,
      "See a list of #{tree_count} remaining trees." => 6,
      "If there are no remaining trees, return to the main menu." => 7
    }
    response = @@prompt.select(question, output, per_page: 7).to_i
    case response
    when 1
      @@bark_texture = "Smooth"
    when 2
      @@bark_texture = "Bumpy"
    when 3
      @@bark_texture = "Furrowed"
    when 4
      @@bark_texture = "Scaled"
    when 5
      @@bark_texture = "Peeling"
    when 6

      question = "Do you want to save a tree to your favorites?"
      output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

      response = @@prompt.select(question, output, per_page:15)

      if response == "Return to Main Menu."
          system "clear"
          Application.application_runner
      elsif response == "No. Return to the question."
          system "clear"
          question_three_conifer
      else
        Favorite.add_to_favorites_from_list(response)
      end
    when 7
      Application.application_runner
    end

  end

  # ____________Question_5_Deciduous_Bark-Color___________________________

  def self.question_five_deciduous
    system "clear"
    tty_runner

    tree_count = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).count
    tree_list = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).pluck(:common_name)

    puts "Your bark is #{@@bark_texture}! There are #{tree_count} trees available."
    puts "The color of tree bark also varies broadly."
    question =  "What color bark does your tree have?"
    output = {
      "Bark is brown." => 1,
      "Bark is gray-brown." => 2,
      "Bark is gray." => 3,
      "Bark is red-brown." => 4,
      "See a list of #{tree_count} remaining trees." => 5,
      "If there are no remaining trees, return to the main menu." => 6
    }
    response = @@prompt.select(question, output).to_i
    case response
    when 1
      @@bark_color = "brown"
    when 2
      @@bark_color = "gray-brown"
    when 3
      @@bark_color = "gray"
    when 4
      @@bark_color = "red-brown"
    when 5

      question = "Do you want to save a tree to your favorites?"
      output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

      response = @@prompt.select(question, output, per_page:15)

      if response == "Return to Main Menu."
          system "clear"
          Application.application_runner
      elsif response == "No. Return to the question."
          system "clear"
          question_three_conifer
      else
        Favorite.add_to_favorites_from_list(response)
      end
    when 6
      Application.application_runner
    end

  end

  # ____________Question_6_Deciduous_Twigs___________________________

  def self.question_six_deciduous
    system "clear"
    tty_runner

    tree_count = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).count
    tree_list = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).pluck(:common_name)

    puts "Your bark is #{@@bark_color}! There are #{tree_count} trees available."
    question =  "What texture are the tree's twigs?"
    output = {
      "Twigs are smooth." => 1,
      "Twigs are hairy." => 2,
      "Twigs are rough." => 3,
      "Twigs are peeling." => 4,
      "Twigs are thorny." => 5,
      "Twigs are sticky." => 6,
      "See a list of #{tree_count} remaining trees." => 7,
      "If there are no remaining trees, return to the main menu." => 8
    }
    response = @@prompt.select(question, output, per_page: 8).to_i
    case response
    when 1
      @@twigs_deciduous = "Smooth"
    when 2
      @@twigs_ = "Hairy"
    when 3
      @@twigs_deciduous = "Rough"
    when 4
      @@twigs_deciduous = "Peeling"
    when 5
      @@twigs_deciduous = "Thorny"
    when 6
      @@twigs_deciduous = "Sticky"
    when 7

      question = "Do you want to save a tree to your favorites?"
      output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

      response = @@prompt.select(question, output, per_page:15)

      if response == "Return to Main Menu."
          system "clear"
          Application.application_runner
      elsif response == "No. Return to the question."
          system "clear"
          question_three_conifer
      else
        Favorite.add_to_favorites_from_list(response)
      end
    when 8
      Application.application_runner
    end
  end

  # ____________Question_7_Deciduous_Fruits___________________________

  def self.question_seven_deciduous
    system "clear"
    tty_runner

    tree_count = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).where("twig_texture = ?", @@twigs_deciduous).count
    tree_list = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).where("twig_texture = ?", @@twigs_deciduous).pluck(:common_name)

    puts "Your twigs are #{@@twigs_deciduous}! There are #{tree_count} trees available."
    question =  "What type of fruit does the tree have?"
    output = {
      "The tree has capsules." => 1,
      "The tree has dry seed." => 2,
      "The tree has acorns." => 3,
      "The tree has samaras." => 4,
      "The tree has fleshy fruit." => 5,
      "The tree has cones." => 6,
      "See a list of #{tree_count} remaining trees." => 7,
      "If there are no remaining trees, return to the main menu." => 8
    }
    response = @@prompt.select(question, output, per_page: 8).to_i
    case response
    when 1
      @@fruit = "Capsules"
    when 2
      @@fruit = "Dry Seed"
    when 3
      @@fruit = "Acorns"
    when 4
      @@fruit = "Samaras"
    when 5
      @@fruit = "Fleshy"
    when 6
      @@fruit = "Cones"
    when 7

      question = "Do you want to save a tree to your favorites?"
      output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

      response = @@prompt.select(question, output, per_page:15)

      if response == "Return to Main Menu."
          system "clear"
          Application.application_runner
      elsif response == "No. Return to the question."
          system "clear"
          question_three_conifer
      else
        Favorite.add_to_favorites_from_list(response)
      end
    when 8
      Application.application_runner
    end
  end

  # ____________Question_8_Deciduous_Flower-Shape___________________________

  def self.question_eight_deciduous
    system "clear"
    tty_runner

    tree_count = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).where("twig_texture = ?", @@twigs_deciduous).where("fruit = ?", @@fruit).count
    tree_list = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).where("twig_texture = ?", @@twigs_deciduous).where("fruit = ?", @@fruit).pluck(:common_name)

    puts "Your fruits are #{@@fruit}! There are #{tree_count} trees available."
    question =  "What shape are the tree's flowers?"
    output = {
      "Flowers are inconspicuous." => 1,
      "Flowers are round." => 2,
      "Flowers are star or cross shaped." => 3,
      "Flowers are bell-shaped." => 4,
      "Flowers are cup-shaped." => 5,
      "Flowers are another shape." => 6,
      "See a list of #{tree_count} remaining trees." => 7,
      "If there are no remaining trees, return to the main menu." => 8
    }
    response = @@prompt.select(question, output, per_page: 8).to_i
    case response
    when 1
      @@flower_shape = "Inconspicuous"
    when 2
      @@flower_shape = "Round"
    when 3
      @@flower_shape = "Star or Cross Shaped"
    when 4
      @@flower_shape = "Bell-Shaped"
    when 5
      @@flower_shape = "Cup-Shaped"
    when 6
      @@flower_shape = "Other"
    when 7

      question = "Do you want to save a tree to your favorites?"
      output = [tree_list, "No. Return to Main Menu.", "No. Return to the question."]

      response = @@prompt.select(question, output, per_page:15)

      if response == "Return to Main Menu."
          system "clear"
          Application.application_runner
      elsif response == "No. Return to the question."
          system "clear"
          question_three_conifer
      else
        Favorite.add_to_favorites_from_list(response)
      end
    when 8
      Application.application_runner
    end
  end

  # ____________Question_9_Deciduous_Flower-Color___________________________

  def self.question_nine_deciduous
    system "clear"
    tty_runner

    tree_count = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).where("twig_texture = ?", @@twigs_deciduous).where("fruit = ?", @@fruit).where("flower_shape = ?", @@flower_shape).count
    tree_list = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).where("twig_texture = ?", @@twigs_deciduous).where("fruit = ?", @@fruit).where("flower_shape = ?", @@flower_shape).pluck(:common_name)

    puts "Your flowers are #{@@flower_shape}! There are #{tree_count} trees available."
    question =  "What color are the tree's flowers?"
    output = {
      "Flowers are yellow." => 1,
      "Flowers are red." => 2,
      "Flowers are white." => 3,
      "Flowers are orange." => 4,
      "Flowers are purple." => 5,
      "Flowers are blue." => 6,
      "Flowers are brown." => 7,
      "Flowers are green." => 8,
      "Flowers are pink." => 9,
      "See a list of #{tree_count} remaining trees." => 10,
      "If there are no remaining trees, return to the main menu." => 11
    }
    response = @@prompt.select(question, output, per_page: 11).to_i
    case response
    when 1
      @@flower_color = "Yellow"
    when 2
      @@flower_color = "Red"
    when 3
      @@flower_color = "White"
    when 4
      @@flower_color = "Orange"
    when 5
      @@flower_color = "Purple"
    when 6
      @@flower_color = "Blue"
    when 7
      @@flower_color = "Brown"
    when 8
      @@flower_color = "Green"
    when 9
      @@flower_color = "Pink"
    when 10

      question = "Do you want to save a tree to your favorites?"
      output = ["Return to Main Menu.", "Return to the question."]

      response = @@prompt.select(question, output)

      if response == "Return to Main Menu."
          system "clear"
          Application.application_runner
      else
          system "clear"
          question_nine_deciduous
      end
    when 11
      Application.application_runner
    end
    response
    tree_list = Tree.all.where("coniferous_deciduous = 'Deciduous'").where("leaf_arrangement = ?", @@leaves).where("leaf_shape = ?", @@leaf_shape).where("bark_texture = ?", @@bark_texture).where("bark_color = ?", @@bark_color).where("twig_texture = ?", @@twigs_deciduous).where("fruit = ?", @@fruit).where("flower_shape = ?", @@flower_shape).where("flower_color = ?", @@flower_color).pluck(:common_name)
    puts tree_list

    question = "You've reached the end. Add the tree to your favorites?"
    output = [tree_list, "Return to main menu", "Exit"]

    response = @@prompt.select(question, output)

    if response == "Return to main menu"
        system "clear"
        Application.application_runner
    elsif response == "Exit"
        abort("Thanks for using TreeFind!!!!!!!!!")
    else
      Favorite.add_to_favorites_from_list(response)
    end
  end
end
