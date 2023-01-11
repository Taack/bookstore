package bookstore

import grails.compiler.GrailsCompileStatic
import org.taack.User
import taack.ast.annotation.TaackFieldEnum

@GrailsCompileStatic
@TaackFieldEnum
class BookstoreBorrower {

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

    List<BookstoreBorrowedBook> leases

    static constraints = {
    }

    static hasMany = [
            leases: BookstoreBorrowedBook
    ]
}
