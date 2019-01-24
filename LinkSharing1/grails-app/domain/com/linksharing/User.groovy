package com.linksharing

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    String email
    String firstName
    String lastName
    byte[] photo
    Boolean admin = false
    Boolean active = true
    Date dateCreated
    Date lastUpdated
    String username
    String password
    String phoneNumber
    boolean enabled = true
    boolean accountExpired=false
    boolean accountLocked=false
    boolean passwordExpired=false

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    User() {}

    User(String email, String username, String password, String firstName, String lastName,String phoneNumber) {
        super()
        this.email = email
        this.username = username
        this.password = password
        this.firstName = firstName
        this.lastName = lastName
        this.phoneNumber=phoneNumber
    }

    static hasMany = [topic:Topic, subscription:Subscription, resource:Resource, readingItem:ReadingItem,
                      resourceRating:ResourceRating]

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        email blank: false,email: true,nullable: false,unique: true
        firstName blank: false,nullable: false
        lastName blank: false,nullable: false
        photo blank: true,nullable: true
        admin blank: false
        active blank: false
        phoneNumber blank: false
    }

    static mapping = {
        password column: '`password`'



    }
}
