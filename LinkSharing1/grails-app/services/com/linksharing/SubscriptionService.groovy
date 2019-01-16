package com.linksharing

import Enums.Seriousness
import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {

    }
    String subscribe(def id){
        Topic topic = Topic.findById(id)
        Subscription subscription=new Subscription(topic,topic.createdBy, Seriousness.CASUAL)
        if(!subscription.save()){
           subscription.errors.allErrors.each {
               println it
           }
            return 'Failed'
        }else{
            return 'Success'
        }

    }

    Subscription subscriber(Integer id){
        def query=Subscription.where{
            id==id
        }

        Subscription subscription=query.find()
        return subscription
    }

    List<Subscription> allSubscription(){
        List<Subscription> lists=Subscription.findAll()
        return lists
    }

    def deleteSubscription(Integer id){
        def s=Subscription.get(id)
        s.delete()
    }
}
