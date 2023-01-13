package bookstore

import grails.compiler.GrailsCompileStatic
import grails.web.api.WebAttributes
import org.codehaus.groovy.runtime.MethodClosure
import org.springframework.context.MessageSource
import org.springframework.context.i18n.LocaleContextHolder
import taack.base.TaackSimpleFilterService
import taack.ui.base.UiFilterSpecifier
import taack.ui.base.UiFormSpecifier
import taack.ui.base.UiMenuSpecifier
import taack.ui.base.UiTableSpecifier
import taack.ui.base.common.ActionIcon
import taack.ui.base.common.ActionIconStyleModifier
import taack.ui.base.form.FormSpec

@GrailsCompileStatic
class BookstoreUiService implements WebAttributes {
    MessageSource messageSource
    TaackSimpleFilterService taackSimpleFilterService

    protected String tr(final String code, final Locale locale = null, final Object[] args = null) {
        if (LocaleContextHolder.locale.language == "test") return code
        try {
            messageSource.getMessage(code, args, locale ?: LocaleContextHolder.locale)
        } catch (e1) {
            try {
                messageSource.getMessage(code, args, new Locale("en"))
            } catch (e2) {
                code
            }
        }
    }

    UiMenuSpecifier buildMenu() {
        UiMenuSpecifier m = new UiMenuSpecifier()
        m.ui {
            menu 'Books', BookstoreController.&books as MethodClosure
            menu 'Authors', BookstoreController.&authors as MethodClosure
            menu 'Shelf', BookstoreController.&shelves as MethodClosure
            menu 'Borrowers', BookstoreController.&borrowers as MethodClosure
            menu 'Borrowed Books', BookstoreController.&borrowedBooks as MethodClosure
        }
        m
    }

    UiFilterSpecifier buildBookFilter() {
        def a = new BookstoreAuthor()
        def b = new BookstoreBook()
        def s = new BookstoreShelf()
        new UiFilterSpecifier().ui BookstoreBook, {
            section 'Author', {
                filterField b.author_, a.firstName_
                filterField b.author_, a.lastName_
            }
            section 'Self', {
                filterField b.bookShelf_, s.place_
            }
            section 'Book', {
                filterField b.name_
                filterField b.isbn_
            }
        }
    }

    UiFilterSpecifier buildAuthorFilter() {
        def a = new BookstoreAuthor()
        def b = new BookstoreBook()
        new UiFilterSpecifier().ui BookstoreAuthor, {
            section 'Author', {
                filterField a.firstName_
                filterField a.lastName_
            }
            section 'Book', {
                filterField a.books_, b.name_
                filterField a.books_, b.isbn_
            }
        }
    }

    UiFilterSpecifier buildShelfFilter() {
        def b = new BookstoreBook()
        def s = new BookstoreShelf()
        new UiFilterSpecifier().ui BookstoreShelf, {
            section 'Self', {
                filterField s.place_
            }
            section 'Book', {
                filterField s.books_, b.name_
                filterField s.books_, b.isbn_
            }
        }
    }

    UiFilterSpecifier buildBorrowerFilter() {
        def b = new BookstoreBorrower()
        def l = new BookstoreBorrowedBook()
        def lb = new BookstoreBook()
        new UiFilterSpecifier().ui BookstoreBorrower, {
            section 'Borrower', {
                filterField b.firstName_
                filterField b.lastName_
            }
            section 'Book', {
                filterField b.leases_, l.book_, lb.name_
                filterField b.leases_, l.book_, lb.isbn_
            }
        }
    }

    UiTableSpecifier buildBookTable(boolean select = false) {

        new UiTableSpecifier().ui BookstoreBook, {

            header {
                def a = new BookstoreAuthor()
                def b = new BookstoreBook()
                def s = new BookstoreShelf()

                column {
                    sortableFieldHeader b.userCreated_
                    sortableFieldHeader b.dateCreated_
                }
                column {
                    sortableFieldHeader b.userUpdated_
                    sortableFieldHeader b.lastUpdated_
                }
                column {
                    sortableFieldHeader b.author_, a.firstName_
                    sortableFieldHeader b.author_, a.lastName_
                }
                column {
                    sortableFieldHeader b.name_
                    sortableFieldHeader b.bookShelf_, s.place_
                }
                column {
                    sortableFieldHeader b.number_
                    fieldHeader 'Stock'
                }
            }
            def objs = taackSimpleFilterService.list(BookstoreBook)

            for (def cb : objs.aValue) {
                row {
                    rowColumn {
                        rowField cb.userCreated.username
                        rowField cb.dateCreated
                    }
                    rowColumn {
                        rowField cb.userUpdated.username
                        rowField cb.lastUpdated
                    }
                    rowColumn {
                        rowField cb.author.firstName
                        rowField cb.author.lastName
                    }
                    rowColumn {
                        if (select)
                            rowLink 'Select an Book', ActionIcon.SELECT * ActionIconStyleModifier.SCALE_DOWN, BookstoreController.&selectBookCloseModal as MethodClosure, cb.id, true
                        else
                            rowLink 'Edit', ActionIcon.EDIT * ActionIconStyleModifier.SCALE_DOWN, BookstoreController.&editBook as MethodClosure, cb.id, true
                        rowField cb.name
                        rowField cb.bookShelf?.place
                    }
                    rowColumn {
                        rowField cb.number
                        rowField cb.stock
                    }
                }
            }
        }
    }

    UiTableSpecifier buildAuthorTable(boolean select = false) {

        new UiTableSpecifier().ui BookstoreAuthor, {

            header {
                def a = new BookstoreAuthor()

                column {
                    sortableFieldHeader tr('column.custom.translation'), a.userCreated_
                    sortableFieldHeader a.dateCreated_
                }
                column {
                    sortableFieldHeader a.userUpdated_
                    sortableFieldHeader a.lastUpdated_
                }
                column {
                    sortableFieldHeader a.firstName_
                    sortableFieldHeader a.lastName_
                }
            }
            def objs = taackSimpleFilterService.list(BookstoreAuthor)

            for (def cb : objs.aValue) {
                row {
                    rowColumn {
                        rowField cb.userCreated.username
                        rowField cb.dateCreated
                    }
                    rowColumn {
                        rowField cb.userUpdated.username
                        rowField cb.lastUpdated
                    }
                    rowColumn {
                        if (select)
                            rowLink 'Select an Author', ActionIcon.SELECT * ActionIconStyleModifier.SCALE_DOWN, BookstoreController.&selectAuthorCloseModal as MethodClosure, cb.id, true
                        else
                            rowLink 'Edit', ActionIcon.EDIT * ActionIconStyleModifier.SCALE_DOWN, BookstoreController.&editAuthor as MethodClosure, cb.id, true
                        rowField cb.firstName
                        rowField cb.lastName
                    }
                }
            }
        }
    }

    UiTableSpecifier buildBorrowerTable(boolean select = false) {

        new UiTableSpecifier().ui BookstoreBorrower, {

            header {
                def b = new BookstoreBorrower()

                column {
                    sortableFieldHeader b.userCreated_
                    sortableFieldHeader b.dateCreated_
                }
                column {
                    sortableFieldHeader b.userUpdated_
                    sortableFieldHeader b.lastUpdated_
                }
                column {
                    sortableFieldHeader b.firstName_
                    sortableFieldHeader b.lastName_
                }
                fieldHeader 'Count Books'
            }
            def objs = taackSimpleFilterService.list(BookstoreBorrower)

            for (def cb : objs.aValue) {
                row {
                    rowColumn {
                        rowField cb.userCreated.username
                        rowField cb.dateCreated
                    }
                    rowColumn {
                        rowField cb.userUpdated.username
                        rowField cb.lastUpdated
                    }
                    rowColumn {
                        rowLink 'Edit', ActionIcon.EDIT * ActionIconStyleModifier.SCALE_DOWN, BookstoreController.&editBorrower as MethodClosure, cb.id, true
                        rowLink 'Add Lease', ActionIcon.ADD * ActionIconStyleModifier.SCALE_DOWN, BookstoreController.&editBorrowedBook as MethodClosure, [borrowerId: cb.id], true
                        rowField cb.firstName
                        rowField cb.lastName
                    }
                    rowField cb.leases.size()
                }
            }
        }
    }

    UiTableSpecifier buildShelfTable(boolean select = false) {

        new UiTableSpecifier().ui BookstoreAuthor, {

            header {
                def s = new BookstoreShelf()

                column {
                    sortableFieldHeader s.userCreated_
                    sortableFieldHeader s.dateCreated_
                }
                column {
                    sortableFieldHeader s.userUpdated_
                    sortableFieldHeader s.lastUpdated_
                }
                sortableFieldHeader s.place_
                fieldHeader 'Count Books'
            }
            def objs = taackSimpleFilterService.list(BookstoreShelf)

            for (def sh : objs.aValue) {
                row {
                    rowColumn {
                        rowField sh.userCreated.username
                        rowField sh.dateCreated
                    }
                    rowColumn {
                        rowField sh.userUpdated.username
                        rowField sh.lastUpdated
                    }
                    rowColumn {
                        if (select)
                            rowLink 'Select an Shelf', ActionIcon.SELECT * ActionIconStyleModifier.SCALE_DOWN, BookstoreController.&selectShelfCloseModal as MethodClosure, sh.id, true
                        else
                            rowLink 'Edit', ActionIcon.EDIT * ActionIconStyleModifier.SCALE_DOWN, BookstoreController.&editShelf as MethodClosure, sh.id, true
                        rowField sh.place
                    }
                    rowField(sh.books*.number.sum() ? sh.books*.number.sum().toString() : '-')
                }
            }
        }
    }

    UiTableSpecifier buildBorrowedBookTable() {

        new UiTableSpecifier().ui BookstoreBorrowedBook, {
            header {
                def b = new BookstoreBook()
                def bb = new BookstoreBorrowedBook()
                def bo = new BookstoreBorrower()

                column {
                    sortableFieldHeader bb.userCreated_
                    sortableFieldHeader bb.dateCreated_
                }
                column {
                    sortableFieldHeader bb.userUpdated_
                    sortableFieldHeader bb.lastUpdated_
                }
                column {
                    sortableFieldHeader bb.book_, b.name_
                    sortableFieldHeader bb.book_, b.author_
                }
                column {
                    sortableFieldHeader bb.borrower_, bo.firstName_
                    sortableFieldHeader bb.borrower_, bo.lastName_
                }
                column {
                    sortableFieldHeader bb.startDate_
                    sortableFieldHeader bb.endDate_
                }
            }

            def objs = taackSimpleFilterService.list(BookstoreBorrowedBook)

            for (def o : objs.aValue) {
                row {
                    rowColumn {
                        rowField o.userCreated.username
                        rowField o.dateCreated
                    }
                    rowColumn {
                        rowField o.userUpdated.username
                        rowField o.lastUpdated
                    }
                    rowColumn {
                        rowField o.book.name
                        rowField o.book.author.firstName + ' ' + o.book.author.lastName
                    }
                    rowColumn {
                        rowField o.borrower.firstName
                        rowField o.borrower.lastName
                    }
                    rowColumn {
                        rowField o.startDate
                        rowField o.endDate
                    }
                }
            }
        }
    }

    UiFormSpecifier buildAuthorForm(BookstoreAuthor author) {
        new UiFormSpecifier().ui author, {
            section 'Author', {
                field author.firstName_
                field author.lastName_
            }
            formAction 'Save', BookstoreController.&saveAuthor as MethodClosure, true
        }
    }

    UiFormSpecifier buildShelfForm(BookstoreShelf shelf) {
        new UiFormSpecifier().ui shelf, {
            field shelf.place_
            formAction 'Save', BookstoreController.&saveShelf as MethodClosure, true
        }
    }

    UiFormSpecifier buildBorrowerForm(BookstoreBorrower borrower) {
        new UiFormSpecifier().ui borrower, {
            field borrower.firstName_
            field borrower.lastName_
            formAction 'Save', BookstoreController.&saveBorrower as MethodClosure, true
        }
    }

    UiFormSpecifier buildBorrowedBookForm(BookstoreBorrowedBook borrowedBook, BookstoreBorrower borrower = null) {
        if (borrower) borrowedBook.borrower = borrower
        new UiFormSpecifier().ui borrowedBook, {
            ajaxField borrowedBook.borrower_, BookstoreController.&selectBorrower as MethodClosure
            ajaxField borrowedBook.book_, BookstoreController.&selectBook as MethodClosure
            formAction 'Save', BookstoreController.&saveBorrowedBook as MethodClosure, true
        }
    }

    UiFormSpecifier buildBookForm(BookstoreBook book) {
        BookstoreAuthor a = new BookstoreAuthor()
        new UiFormSpecifier().ui book, {
            section 'Book', FormSpec.Width.DOUBLE_WIDTH, {
                col {
                    field book.isbn_
                }
                col {
                    field book.name_
                }
                field book.abstractText_
            }
            section 'Author', {
                ajaxField book.author_, BookstoreController.&selectAuthor as MethodClosure
            }
            section 'Stocks', {
                field book.salePrice_
                field book.number_
                ajaxField book.bookShelf_, BookstoreController.&selectShelf as MethodClosure
            }
            formAction 'Save', BookstoreController.&saveBook as MethodClosure, true
        }
    }
}

