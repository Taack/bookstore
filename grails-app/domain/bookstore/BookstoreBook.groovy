package bookstore

import grails.compiler.GrailsCompileStatic
import org.taack.User
import taack.ast.annotation.TaackFieldEnum

@GrailsCompileStatic
@TaackFieldEnum
class BookstoreBook {

    User userCreated
    User userUpdated
    Date dateCreated
    Date lastUpdated

    String isbn
    String name
    String abstractText
    BookstoreAuthor author
    BookstoreShelf bookShelf
    BigDecimal salePrice
    Integer number = 0

    Integer getStock() {
        number - BookstoreBorrowedBook.countByBookAndEndDateIsNull(this)
    }

    static constraints = {
        bookShelf nullable: true
        salePrice nullable: true
        abstractText nullable: true, widget: 'textarea'
        isbn nullable: true, validator: { val, obj ->
            if (!val) return
            boolean ok = val ==~ /^(?:ISBN(?:-10)?:?●)?(?=[0-9X]{10}$|(?=(?:[0-9]+[-●]){3})[-●0-9X]{13}$)[0-9]{1,5}[-●]?[0-9]+[-●]?[0-9]+[-●]?[0-9X]$/
            if (!ok)
                return ['error.invalid.isbn.format']
        }
    }

    @Override
    String toString() {
        return "${name}($id)"
    }
}
