package bookstore

import grails.compiler.GrailsCompileStatic
import org.taack.User
import taack.ast.annotation.TaackFieldEnum

@GrailsCompileStatic
@TaackFieldEnum
class BookstoreBorrowedBook {
    @Override
    String toString() {
        return "${book.name}, From ${startDate} To ${endDate ?: '-'}"
    }
    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated

    Date startDate = new Date()
    Date endDate

    BookstoreBorrower borrower
    BookstoreBook book

    static constraints = {
        endDate nullable: true, validator: { Date d, BookstoreBorrowedBook lease ->
            if (!d) return
            if (d > lease.startDate) {
                return ['endDate.before.startDate']
            }
        }
        book validator: { BookstoreBook b, BookstoreBorrowedBook lease ->
            def ll = lease.borrower.leases - lease
            if (ll*.book.id.contains(b.id))
                return ['error.borrower.already.rent.this.book', b.name]
            if (b.stock <= 0)
                return ['error.book.not.in.stock', b.name]
        }
    }
}
