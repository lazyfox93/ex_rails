class Owner < ActiveRecord::Base
  has_many :cats

  before_create :before_create_callback
  after_create :after_create_callback
  around_create :around_around_callback

  before_update :before_update_callback
  after_update :after_update_callback

  before_destroy :before_destroy_callback
  after_destroy :after_destroy_callback

  before_save :before_save_callback
  after_save :after_save_callback

  find_initialize :after_find_callback

  after_commit :after_commit_callback, on: [:create]

  scope :ordered_asc, -> { order(name: :asc) }

  scope :with_cats, -> { joins(:cats) } 

  validates :name, presence: true

  def after_commit_callback
  	pust "callback after comimmit"
  end
  def after_find_callback
  	puts 'after_fibd work'
  	#self.name = 'Nobody'
  end

  def after_create_callback
  	puts 'callback work!'
  end

  def before_create_callback
  	puts 'This callback work too'
  end

  def around_around_callback
  	puts "Around callback"
  end


  def after_update_callback
  	puts 'After update!!'
  end

  def before_update_callback
  	puts 'Before update'
  end

  def before_save_callback
  	puts "Before save callback"
  end

  def after_save_callback
  	puts "After save callback"
  end


  def after_destroy_callback
  	puts 'After destroy!!'
  end

  def before_destroy_callback
  	puts 'Before destroy'
  end

end
