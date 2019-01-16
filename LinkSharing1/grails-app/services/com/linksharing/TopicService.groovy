package com.linksharing

import CO.TopicCo
import Enums.Seriousness
import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

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

    List<Topic> topics() {
        List<Topic> list = Topic.findAll()
        return list
    }
}
