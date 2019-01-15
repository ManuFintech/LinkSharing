package com.linksharing

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {

    }
    Subscription subscribe(Topic topic,User user,Enums.Seriousness seriousness){
        Subscription subscription=new Subscription(topic,user,seriousness)
        return subscription
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
