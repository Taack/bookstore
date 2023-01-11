package bookstore

import grails.compiler.GrailsCompileStatic
import org.taack.User
import taack.ast.annotation.TaackFieldEnum

@GrailsCompileStatic
@TaackFieldEnum
class BookstoreShelf {
    @Override
    String toString() {
        return "$place($id)"
    }
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated

    String place

    Set<BookstoreBook> books

    static constraints = {
    }

    static hasMany = [
            books: BookstoreBook
    ]
}
