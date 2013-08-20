# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

module DevStudy
  MEMBERS = [{name: "이강훈", email: "hunscompay@gmail.com"}, {name: "민동국", email: "dk.min7@gmail.com"}, {name: "김성준", email: "me@kimseongjun.co.kr"}, {name: "최완복", email: "choi@wanbok.com"}, {name: "이범재", email: "beomjae@gmail.com"}, {name: "정규용", email: "obliviscence@gmail.com"}, {name: "성현준", email: "hjsung@gmail.com"}, {name: "이원우", email: "wonury@gmail.com"}, {name: "김한기", email: "meoooh@gmail.com"}, {name: "김대권", email: "propellerheaven@gmail.com"}, {name: "박창진", email: "crazevil@gmail.com"}, {name: "이의범", email: "spearsky@gmail.com"}, {name: "최현준", email: "peinsiro@gmail.com"}, {name: "이한국", email: "leekorea09@gmail.com"}, {name: "김학일", email: "hakil.kim@gmail.com"}, {name: "김재진", email: "nije1983@gmail.com"}, {name: "류용수", email: "cloudr2@gmail.com"}, {name: "유경록", email: "hi.raphael@gmail.com"}, {name: "홍두희", email: "doohee323@gmail.com"}, {name: "이준헌", email: "for2ternity@gmail.com"}, {name: "김학현", email: "kimhakhyun@gmail.com"}, {name: "정승환", email: "draken74@gmail.com"}, {name: "김성철", email: "bearuse@gmail.com"}, {name: "김수혁", email: "kimsuhyuk@gmail.com"}, {name: "방정현", email: "zahoku@gmail.com"}, {name: "김태경", email: "dev.bistros@gmail.com"}, {name: "공지훈", email: "sagehoon@gmail.com"}, {name: "변용훈", email: "yonghunbyun@gmail.com"}, {name: "김진영", email: "jingood2@gmail.com"}, {name: "유동우", email: "frozenrain.yoo@gmail.com"}, {name: "윤해빈", email: "deneb78@gmail.com"}, {name: "장재휴", email: "bbugguj@gmail.com"}, {name: "이재우", email: "netu010@gmail.com"}, {name: "윤영식", email: "ysyun@yuwin.co.kr"}, {name: "곽두환", email: "doohwan.kwak@gmail.com"}, {name: "백호근", email: "hokun.baek@gmail.con"}, {name: "윤연식", email: "siktaeng@gmail.com"}, {name: "이재경", email: "skullee84@gmail.com"}, {name: "황인성", email: "DemianHwang@gmail.com"}, {name: "이성호", email: "seongho.com@gmail.com"}, {name: "허석", email: "heoseok87@gmail.com"}, {name: "조재효", email: "jaehyo@gmail.com"}, {name: "김성환", email: "ssshwan@gmail.com"}, {name: "함기훈", email: "progh2@gmail.com"}, {name: "이승구", email: "seunggu.lee@gmail.com"}]
end

def create_admin
  admin = User.find_or_create_by!(:email => 'admin@stub.lapisan',
                                  :password => 'abcd1234',
                                  :password_confirmation => 'abcd1234'
                                  ) unless User.find_by email: "admin@stub.lapisan"
end

def create_user
  user = User.create!(:email => 'user@stub.lapisan',
                                  :password => 'abcd1234',
                                  :password_confirmation => 'abcd1234'
                                  ) unless User.find_by email: "user@stub.lapisan"
end

def create_members
  DevStudy::MEMBERS.each do |member|
    User.create!(email: member[:email],
                            password: "devstudy",
                            password_confirmation: "devstudy")
  end
end

def create_posts
  100.times do
    Post.create!(title: Faker::Lorem.sentence(3),
                 entry: Faker::Lorem.paragraph(50),
                 user_id: rand(2) + 1
                 )
  end
  puts '100 post created'
end

puts 'SETTING UP DEFAULT USER LOGIN'
create_admin
create_user
create_members
create_posts









