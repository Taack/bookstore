package bookstore

import grails.compiler.GrailsCompileStatic
import org.taack.User
import taack.ast.annotation.TaackFieldEnum

@GrailsCompileStatic
@TaackFieldEnum
class BookstoreAuthor {

    @Override
    String toString() {
        return "${firstName} ${lastName}($id)"
    }
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated

    String firstName
    String lastName

    Set<BookstoreBook> books

    static constraints = {
    }

    static hasMany = [
            books: BookstoreBook
    ]
}
