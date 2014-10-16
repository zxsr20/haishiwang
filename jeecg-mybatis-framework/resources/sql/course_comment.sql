drop table if exists `sx_course_comments`;

 CREATE TABLE `sx_course_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `course_id` int(11) DEFAULT NULL comment '课程ID',
  `user_id` int(11) DEFAULT NULL COMMENT '评论用户ID',
  `content` varchar(2000) DEFAULT NULL COMMENT '评论内容',
  `create_date` varchar(36) DEFAULT NULL COMMENT '评论创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into sx_course_comments(course_id, user_id, content, create_date)values('66', '106', '课程测试评论课程测试评论课程测试评论', '2014-10-19');
insert into sx_course_comments(course_id, user_id, content, create_date)values('66', '107', '课程测试评论课程测试评论课程测试评论', '2014-10-19');
insert into sx_course_comments(course_id, user_id, content, create_date)values('66', '109', '课程测试评论课程测试评论课程测试评论', '2014-10-19');
insert into sx_course_comments(course_id, user_id, content, create_date)values('66', '108', '课程测试评论课程测试评论课程测试评论', '2014-10-19');
insert into sx_course_comments(course_id, user_id, content, create_date)values('66', '109', '课程测试评论课程测试评论课程测试评论', '2014-10-19');
insert into sx_course_comments(course_id, user_id, content, create_date)values('66', '104', '课程测试评论课程测试评论课程测试评论', '2014-10-19');
insert into sx_course_comments(course_id, user_id, content, create_date)values('66', '102', '课程测试评论课程测试评论课程测试评论', '2014-10-19');
insert into sx_course_comments(course_id, user_id, content, create_date)values('66', '106', '课程测试评论课程测试评论课程测试评论', '2014-10-19');
insert into sx_course_comments(course_id, user_id, content, create_date)values('66', '101', '课程测试评论课程测试评论课程测试评论', '2014-10-19');