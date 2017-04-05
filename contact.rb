# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
class Contact

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@id = 0

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = 'none')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1 # this way the next contact will get a different id
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.find { |entry| entry.id == id }
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(key, value)
    case key
    when :first_name
      @first_name = value
    when :last_name
      @last_name = value
    when :email
      @email = value
    when :note
      @note = value
    when "first_name" #If you want to use "" instead of :
      @first_name = value
    when "last_name"
      @last_name = value
    when "email"
      @email = value
    when "note"
      @note = value
    else
      return false
    end
    true
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(key, value)
    @@contacts.each do |entry|
      case key
      when :first_name
        return entry if entry.first_name == value
      when :last_name
        return entry if entry.last_name == value
      when :email
        return entry if entry.email == value
      when :note
        return entry if entry.note.include?(value)
      when "first_name"
        return entry if entry.first_name == value
      when "last_name"
        return entry if entry.last_name == value
      when "email"
        return entry if entry.email == value
      when "note"
        @note = value
      else
        return entry if entry.note.include?(value)
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
      @@contacts.delete(self) #I'm honestly just making an educated guess with this one. Or just a regular guess.
  end

  # Feel free to add other methods here, if you need them.

  #No. I refuse.

end
