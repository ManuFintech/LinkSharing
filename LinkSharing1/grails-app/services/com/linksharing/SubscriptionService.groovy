package com.linksharing

import Enums.Seriousness
import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {

    }
    String subscribe(def param1,Seriousness param2){
        println("::::::::::::::::::::::"+param1+" "+param2)
        Topic topic = Topic.findById(param1)
        println("<<<<<<<<<<<<<<<<<<<"+topic.name)
        Subscription subscription=new Subscription(topic,topic.createdBy,param2)
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

    def deleteSubscription(def id){
        println("Hit is coming......................."+id)
        Subscription subscription=Subscription.get(id)
        println("+++++++++++++++++++++++"+s)
        if(!s.delete(flush: true)){
            subscription.errors.allErrors.each{
                println it
            }
        }else {
            println "Success"
        }
    }
}
