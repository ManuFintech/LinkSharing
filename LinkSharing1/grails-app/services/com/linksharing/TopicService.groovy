package com.linksharing

import CO.TopicCo
import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def serviceMethod() {

    }

    String createNewTopic(TopicCo topicCo, String userName){
        println("::::::::::::::::::::"+userName)
//        def query=User.where{
//
//        }
        User user=new User("manu@fintech","ManuMishra","manu","Manu","Mishra","")  //To be deleted temporary
        Topic topic=new Topic(topicCo.name,topicCo.visibility,user)
        if(!topic.save()){
            topic.errors.allErrors.each{
                println it
            }
        }else
            return 'success'
    }

    Topic topic(Integer id){
        def query=Topic.where{
            id==id
        }
        Topic topic=query.find()
        return topic

    }

    List<Topic> topics(){
        List<Topic> list= Topic.findAll()
        return  list
    }
}
