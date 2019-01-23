package com.linksharing

import CO.TopicCo
import Enums.Seriousness
import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def springSecurityService

    def serviceMethod() {

    }

    String createNewTopic(TopicCo topicCo, String userName) {
        User user = User.findByUsername(userName)
        Topic topic = new Topic(topicCo.topic, topicCo.visibility, user)
        if (topic.validate()) {
            if (!topic.save()) {
                topic.errors.allErrors.each {
                    println it
                }
            } else {
                Subscription subscription = new Subscription(topic, user, Seriousness.CASUAL)
                if (subscription.save(flush: true)) {
                    return 'success'
                } else {
                    subscription.errors.allErrors.each {
                        println it
                    }
                }


            }
        } else {
            topic.errors.allErrors.each {
                println it
            }
        }

    }

    Topic topic(Integer id) {
        def query = Topic.where {
            id == id
        }
        Topic topic = query.find()
        return topic

    }

        def topics() {
            User user=springSecurityService.currentUser
            List<Topic> topicList=Topic.findAll()
            println("tttttttttttttttttttt"+topicList)
            List<Subscription> subscriptionList=Subscription.findAllByUser(user)
            println("sssssssssssssssssssssss"+subscriptionList)
            List<Long> topicsID=new ArrayList<>()
            for(Topic t:topicList){
                topicsID.add(t.id)
            }
            println(topicsID)

            List<Long> topicsIDsubscribedByUser=new ArrayList<>()
            for(Subscription s:subscriptionList){
                topicsIDsubscribedByUser.add(s.topic.id)
            }

            println(topicsIDsubscribedByUser)

            topicsID.removeAll(topicsIDsubscribedByUser)

            println(topicsID)

            List<Topic> listOfTopicsUnsubscribed=new ArrayList<>()

            for(def d:topicsID){
                Topic topic=Topic.findById(d)
                listOfTopicsUnsubscribed.add(topic)
            }
            HashMap hashMap=new HashMap()
            hashMap.put("subscribedByUser",subscriptionList)
            hashMap.put("unsubcribedToUser",listOfTopicsUnsubscribed)
            return hashMap





    }

    def allTopics(){
        List<Topic> allTopics=Topic.findAll()
        return allTopics


    }
}
