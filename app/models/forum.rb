class Forum < ApplicationRecord
  has_many :posts
  def self.main_list(filter, order = nil)
    forums = Forum.joins(
      "LEFT OUTER JOIN (SELECT COUNT(*) AS count_all, posts.forum_id AS posts_forum_id, MAX(write_dttm) AS write_dttm FROM posts GROUP BY posts.forum_id) posts
      ON forums.forum_id = posts.posts_forum_id")
                 .select("forums.*, COALESCE(posts.count_all, 0) AS count_all, write_dttm")
                 .where("parent_forum_id IS NULL AND forum_nm like ?", "%#{filter}%")
                 .order("forum_id").reorder(order)
    return forums
  end

  # def self.sub_list(id)
  #   forums = Forum.joins(
  #       "LEFT OUTER JOIN (SELECT COUNT(*) AS count_all, `posts`.`forum_id` AS posts_forum_id FROM `posts` GROUP BY `posts`.`forum_id`) posts
  #     ON forums.forum_id = posts.posts_forum_id")
  #                .select("forums.*, COALESCE(posts.count_all, 0) AS count_all")
  #                .where("parent_forum_id = ?", id).order("forum_id")
  #   return forums
  # end
end
