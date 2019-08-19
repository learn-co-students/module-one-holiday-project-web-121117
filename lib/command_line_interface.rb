class CommandLineInterface

  def greet
    puts "\n(づ｡◕‿‿◕｡)づ Welcome to TropeBrowser! Type 'Exit' at any time to exit!"
    puts ''
  end

  def goodbye
    puts "(づ｡◕‿‿◕｡)づ Thanks for using TropeBrowser!"
    puts ''
  end

  def thank
    puts "(づ｡◕‿‿◕｡)づ Thanks for helping us update our database!"
    puts ''
  end

  def list_associated_tropes
    puts 'Here are some tropes in your selected work:'
  end

  def list_associated_artistic_works
    puts 'Here are some artistic works that use your selected trope:'
  end

  def gets_user_work_input
    puts "Find tropes in your favorite work!"
    puts "Enter a title or enter 'All' to retrieve all entries:"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def gets_user_work_update_input
    puts "Which work would you like to update?"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def gets_user_work_destroy_input
    puts "Which work would you like to destroy?"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def gets_user_trope_input
    puts "Find artistic works that use a trope!"
    puts "Enter the name of a trope or enter 'All' to retrieve all entries:"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def gets_user_trope_update_input
    puts "Which trope would you like to update?"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def gets_user_trope_destroy_input
    puts "Which trope would you like to destroy?"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def gets_user_new_work_input
    puts "What is the title of the artistic work you would like to add?"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def gets_user_new_work_release_year_input
    puts "What is the release year of this work?"
    puts ''
    input = gets.chomp.to_i
    puts ''
    input
  end

  def gets_user_new_trope_input
    puts "What is the name of the trope you would like to add?"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def gets_user_work_for_association
    puts "What is the name of the artistic work you would like to associate?"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def gets_user_trope_for_association
    puts "What is the name of the trope you would like to associate?"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def crud_selector
    puts "Do you want to:\n'C' - Create a new entry\n'R' - Retrieve info about existing entries\n'U' - Update an existing entry\n'D' - Delete an entry"
    puts ''
    selection = gets.chomp.titleize
    puts ''
    if selection != 'C' && selection != 'R' && selection != 'U' && selection != 'D' && selection != 'Exit'
      puts "Please enter 'C', 'R', 'U', 'D', or 'Exit'!"
      puts ''
      crud_selector
    else
      selection
    end
  end

  def trope_or_work_select(crud)
    puts "#{crud} info about 'Artistic Works' or 'Tropes'?"
    puts ''
    selection = gets.chomp.titleize
    puts ''
    if selection == 'Trope'
      selection = 'Tropes'
    elsif selection == 'Work' || selection == 'Artistic Work' || selection == 'Works' || selection == 'Art'
      selection = 'Artistic Works'
    end
    selection
  end

  def trope_work_or_association_select(crud)
    puts "#{crud} info about 'Artistic Works', 'Tropes', or 'Associations'?"
    puts ''
    selection = gets.chomp.titleize
    puts ''
    if selection == 'Trope'
      selection = 'Tropes'
    elsif selection == 'Work' || selection == 'Artistic Work' || selection == 'Works' || selection == 'Art'
      selection = 'Artistic Works'
    elsif selection == 'Association'
      selection = 'Associations'
    end
    selection
  end

  def create_or_associate
    puts "'Create' a Trope/Artistic Work entry or 'Associate' existing entries?"
    puts ''
    input = gets.chomp.titleize
    puts ''
    input
  end

  def run

    greet

    crud_selection = crud_selector # 4 branches if statement
    if crud_selection == 'Exit'
      return
    elsif crud_selection == 'C'
      create_data
    elsif crud_selection == 'R'
      retrieve_data
    elsif crud_selection == 'U'
      update_data
    elsif crud_selection == 'D'
      destroy_data
    end

    goodbye

  end

  def create_data
    input = create_or_associate
    if input == 'Create'
      selection = nil
      while selection == nil
        selection = trope_or_work_select("Create")
        if selection == 'Artistic Works'
          title = gets_user_new_work_input
          if title == 'Exit'
            break
          end
          # create artistic work
          if ArtisticWork.find_by(name: title)
            puts "Hey! It looks like that work is already in our database!"
            puts ''
            create_data
          elsif !(ArtisticWork.find_by(name: title))
            new_work = ArtisticWork.create(name: title)
            year = gets_user_new_work_release_year_input
            new_work.release_year = year
            new_work.save
            thank
            run
          end
        elsif selection == 'Tropes'
          trope_name = gets_user_new_trope_input
          if trope_name == 'Exit'
            break
          end
          # create trope
          if Trope.find_by(name: trope_name)
            puts "Hey! It looks like that trope is already in our database!"
            puts ''
            create_data
          else
            new_work = Trope.create(name: trope_name)
            thank
            run
          end
        elsif selection == 'Exit'
          return
        else
          puts "Sorry, that's an invalid command!"
          create_data
        end
      end
    elsif input == 'Associate'
      # get trope and work
      work_input = gets_user_work_for_association
      trope_input = gets_user_trope_for_association
      #check for validity
      work = find_artistic_work(work_input)
      trope = find_trope(trope_input)
      if !(work && trope)
        puts "Sorry we couldn't find one or both of those entries!"
        puts ''
        create_data
      elsif work && trope
        #check if artistic_work_tropes already has association
        if ArtisticWorkTrope.find_by(trope_id: trope.id, artistic_work_id: work.id)
          puts "Looks like that work and trope are already associated!"
          puts ''
          create_data
        else
          work.tropes << trope
          run
        end
      end
    elsif input == 'Exit'
      return
    else
      puts "Sorry, that's an invalid command!"
      create_data
    end
  end

  def retrieve_data
    selection = nil
    while selection == nil
      selection = trope_or_work_select("Retrieve")
      if selection == 'Artistic Works' #Artistic Works branch

        input = gets_user_work_input

        if input == 'Exit'
          return
        elsif input == 'All'
          artistic_work = 'All'
        else
          artistic_work = find_artistic_work(input)
        end

        if artistic_work == nil
          puts "Sorry! We can't find anything by that name in our database!"
          puts ''
          retrieve_data
        elsif artistic_work == 'All'
          puts find_all_artistic_works
          run
        else
          list_associated_tropes #puts text
          puts find_tropes_from_artistic_work(artistic_work)
          run
        end

      elsif selection == 'Tropes' #Tropes branch

        input = gets_user_trope_input

        if input == 'Exit'
          return
        elsif input == 'All'
          trope = 'All'
        else
          trope = find_trope(input)
        end

        if trope == nil
          puts "Sorry! We can't find anything by that name in our database!"
          puts ''
          retrieve_data
        elsif trope == 'All'
          puts find_all_tropes
          run
        else
          list_associated_artistic_works #puts text
          puts find_artistic_works_from_trope(trope)
          run
        end

      elsif selection == 'Exit'
        break
      else
        puts "Please select either 'Artistic Works' or 'Tropes'!"
        puts ''
        selection = nil
      end
    end
  end

  def update_data
    selection = nil
    while selection == nil
      selection = trope_or_work_select("Update")
      if selection == 'Artistic Works' #Artistic Works branch

        input = gets_user_work_update_input

        if input == 'Exit'
          return
        else
          artistic_work = find_artistic_work(input)
        end

        if artistic_work == nil
          puts "Sorry! We can't find anything by that name in our database!"
          puts ''
          update_data
        else
          puts "Update name or release year?"
          puts ''
          name_or_year = gets.chomp.titleize
          if name_or_year == 'Name'
            puts "What would you like to change the name to?"
            updated_val = gets.chomp.titleize
            artistic_work.name = updated_val
            artistic_work.save
            thank
          elsif name_or_year == 'Release Year'
            puts "What would you like to change the release year to?"
            updated_val = gets.chomp.to_i
            artistic_work.release_year = updated_val
            artistic_work.save
            thank
          else
            puts "Sorry, that's not a valid command!"
            update_data
          end
          run
        end

      elsif selection == 'Tropes' #Tropes branch

        input = gets_user_trope_update_input

        if input == 'Exit'
          return
        else
          trope = find_trope(input)
        end

        if trope == nil
          puts "Sorry! We can't find anything by that name in our database!"
          puts ''
          update_data
        else
          puts "What would you like to change the trope name to?"
          puts ''
          updated_val = gets.chomp.titleize
          trope.name = updated_val
          trope.save
          thank
          run
        end

      elsif selection == 'Exit'
        break
      else
        puts "Please select either 'Artistic Works' or 'Tropes'!"
        puts ''
        selection = nil
      end
    end
  end

  def destroy_data
    selection = nil
    while selection == nil
      selection = trope_work_or_association_select("Destroy")
      if selection == 'Artistic Works' #Artistic Works branch

        input = gets_user_work_destroy_input

        if input == 'Exit'
          return
        else
          artistic_work = find_artistic_work(input)
        end

        if artistic_work == nil
          puts "Sorry! We can't find anything by that name in our database!"
          puts ''
          destroy_data
        else
          artistic_work.destroy
          thank
          run
        end

      elsif selection == 'Tropes' #Tropes branch

        input = gets_user_trope_destroy_input

        if input == 'Exit'
          return
        else
          trope = find_trope(input)
        end

        if trope == nil
          puts "Sorry! We can't find anything by that name in our database!"
          puts ''
          destroy_data
        else
          trope.destroy
          thank
          run
        end

      elsif selection == 'Associations' #Association branch

        # get trope and work
        work_input = gets_user_work_for_association
        trope_input = gets_user_trope_for_association
        #check for validity
        work = find_artistic_work(work_input)
        trope = find_trope(trope_input)
        if !(work && trope)
          puts "Sorry we couldn't find one or both of those entries!"
          puts ''
          create_data
        elsif work && trope
          #check if artistic_work_tropes already has association
          work_to_destroy = ArtisticWorkTrope.find_by(trope_id: trope.id, artistic_work_id: work.id)
          if work_to_destroy
            work_to_destroy.destroy
            thank
            run
          else
            puts "Looks like that work and trope weren't associated!"
            destroy_data
          end
        end
      elsif selection == 'Exit'
        break
      else
        puts "Please select either 'Artistic Works' or 'Tropes'!"
        puts ''
        selection = nil
      end
    end
  end

  def find_artistic_work(input)
    ArtisticWork.find_by(name: input)
  end

  def find_trope(input)
    Trope.find_by(name: input)
  end

  def find_all_artistic_works
    sorted = ArtisticWork.all.sort_by do |artistic_work|
      artistic_work.release_year
    end
    sorted.map do |artistic_work|
      "#{artistic_work.release_year} - #{artistic_work.name}"
    end
  end

  def find_all_tropes
    sorted = Trope.all.sort_by do |trope|
      trope.name
    end
    sorted.map do |trope|
      trope.name
    end
  end

  def find_tropes_from_artistic_work(artistic_work)
    sorted = artistic_work.tropes.sort_by do |trope|
      trope.name
    end
    sorted.map do |trope|
      trope.name
    end
  end

  def find_artistic_works_from_trope(trope)
    sorted = trope.artistic_works.sort_by do |artistic_work|
      artistic_work.release_year
    end
    sorted.map do |artistic_work|
      "#{artistic_work.release_year} - #{artistic_work.name}"
    end
  end

end
