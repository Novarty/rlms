class Course < ApplicationRecord
  belongs_to :teacher

  has_many :topics, dependent: :destroy

  has_many :course_participations
  has_many :learners, through: :course_participations

  validates :title, :slug, :description, :teacher_id, presence: true
  validates :title, :slug, :description, uniqueness: true
  validate  :slug, :slug_course_validate

  scope :published, -> { where(published: true) }
  scope :not_published, -> { where(published: false) }

  scope :ordered_by_title, -> { order(title: :asc) }

  WHITELIST = /^[a-zA-Z0-9_-]*$/
  def slug_course_validate
    unless WHITELIST=~ slug
      errors[:slug] << I18n.t("slug.invalide")
    end
  end

  def to_param
    slug
  end
end
