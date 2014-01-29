class Person < ActiveRecord::Base
  attr_accessible :birthday, :description, :email, :name, :secret, :general_audiences, :teen_up, :mature, :explicit, :graphic_violence, :violence, :major_character_death, :character_death, :sex, :rape, :abuse, :child_abuse, :admin
  
  #name is mandatory
  validates_presence_of :name,
  	:message => "Please provide a username."
  	
  #name must be unique
  validates_uniqueness_of :name,
  	:case_sensitive => false,
  	:message => "must be unique."	
  
  #password is mandatory
  validates_presence_of :secret,
  	:message => "Please provide a password."
  	
  #email address is mandatory
  validates_presence_of :email,
  	:message => "Please provide an email address."
  	
  #email address must look like an email address
  #code taken from _Learning Rails 3_
  validates_format_of :email,
  	:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
  	:message => "doesn't look like a real email address."
  	
  #one user per email address
  #FIXME
  #figure out how to put a link to the password reset page here
  #write a password reset page
  validates_uniqueness_of :email,
  	:case_sensitive => false,
  	:message => "already has an account here."
  	
  
end
