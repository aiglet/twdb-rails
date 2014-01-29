class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :description, :pub_date, :title, :general_audiences, :teen_up, :mature, :explicit, :graphic_violence, :violence, :major_character_death, :character_death, :sex, :rape, :abuse, :child_abuse, :no_ISBN, :cover
  
  # title is mandatory
  validates_presence_of :title,
  	:message => "is mandatory"
  	
  #author is mandatory
  validates_presence_of :author,
  	:message => "is mandatory"
  	
  #ISBN is mandatory
  validates_presence_of :ISBN, 
  	#FIXME - :no_ISBN tickybox check
  	#:unless => :no_ISBN,
    :message => "is mandatory"
  	
  #ISBN must be numeric
  validates_numericality_of :ISBN,
  	:only_integer => true,
  	:message => "can only contain numbers 0 - 9"
  	
  #ISBN must be either 10 or 13 digits long 
  #FIXME
  #Figure out how to make it actually check for either 10 or 13, instead of assuming no one will ever typo to either 11 or 12.
  validates_length_of :ISBN,
  	:in => 10..13,
  	:message => "must be either 10 or 13 numbers"

#The following code was borrowed pretty much straight from "Learning Rails 3". I  mostly understand what it does, I think, but I would never have gotten there on my own.
  	
  #after the book has been written to the database, deal with the images
  after_save :store_cover
  
	#when cover data is uploaded, store the file data for later and put the extension in the correct part of the DB
	def cover=(file_data)
		unless file_data.blank?
			#store the file data in a private instance variable
			@file_data = file_data
			#get the extension and store this as a variable too
			self.extension = file_data.original_filename.split('.').last.downcase
		end
	end
	
	#Filename housekeeping
	COVER_STORE = File.join Rails.root, 'public', 'cover_store'
	
	#where to write the image file to (changes the filename from whatever it was when it was uploaded to the book ID + the extension)
		def cover_filename
			File.join COVER_STORE, "#{id}.#{extension}"
		end
		
	#return a path we can use in HTML for this image
		def cover_path
			"/cover_store/#{id}.#{extension}"
		end
		
	#check to make sure a cover exists
	def has_cover?
		File.exists? cover_filename
	end	

private

#writes the cover data to the filesystem
def store_cover
	if @file_data
		#make the cover_store directory if it doesn't already exist
		FileUtils.mkdir_p COVER_STORE
		#put the image data in the file
		File.open(cover_filename, 'wb') do |f|
			f.write(@file_data.read)
		end
		#ensure file saved only when it newly arrives at model being saved
		@file_data = nil
	end
end
  
end
