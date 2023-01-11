package bookstore

import grails.artefact.Controller
import grails.compiler.GrailsCompileStatic
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.runtime.MethodClosure
import taack.base.TaackSimpleSaveService
import taack.base.TaackUiSimpleService
import taack.ui.base.UiBlockSpecifier
import taack.ui.base.block.BlockSpec
import taack.ui.base.common.ActionIcon

@GrailsCompileStatic
@Secured(['ROLE_ADMIN'])
class BookstoreController implements Controller {
    TaackUiSimpleService taackUiSimpleService
    BookstoreUiService bookstoreUiService
    TaackSimpleSaveService taackSimpleSaveService

    def index() {
        UiBlockSpecifier b = new UiBlockSpecifier()
        b.ui {
            ajaxBlock "helloWorld", {
                custom "Hello World!"
            }
        }
        taackUiSimpleService.show(b, bookstoreUiService.buildMenu())
    }

    def books() {
        def b = new UiBlockSpecifier().ui {
            ajaxBlock 'books', {
                tableFilter 'Filter', bookstoreUiService.buildBookFilter(),
                    'Books', bookstoreUiService.buildBookTable(), {
                    action 'Edit Book', ActionIcon.ADD, this.&editBook as MethodClosure, true
                }
            }
        }
        taackUiSimpleService.show(b, bookstoreUiService.buildMenu())
    }

    def authors() {
        def b = new UiBlockSpecifier().ui {
            ajaxBlock 'authors', {
                tableFilter 'Filter', bookstoreUiService.buildAuthorFilter(),
                    'Authors', bookstoreUiService.buildAuthorTable(), {
                    action 'Create New Author', ActionIcon.ADD, this.&editAuthor as MethodClosure, true
                }
            }
        }
        taackUiSimpleService.show(b, bookstoreUiService.buildMenu())
    }

    def borrowedBooks() {
        def b = new UiBlockSpecifier().ui {
            ajaxBlock 'borrowedBooks', {
                table 'Borrowed Books', bookstoreUiService.buildBorrowedBookTable(), BlockSpec.Width.MAX
            }
        }
        taackUiSimpleService.show(b, bookstoreUiService.buildMenu())
    }

    def shelves() {
        def b = new UiBlockSpecifier().ui {
            ajaxBlock 'places', {
                tableFilter 'Filter', bookstoreUiService.buildShelfFilter(),
                    'Places', bookstoreUiService.buildShelfTable(), {
                    action 'Create New Place', ActionIcon.ADD, this.&editShelf as MethodClosure, true
                }
            }
        }
        taackUiSimpleService.show(b, bookstoreUiService.buildMenu())
    }

    def borrowers() {
        def b = new UiBlockSpecifier().ui {
            ajaxBlock 'borrowers', {
                tableFilter 'Filter', bookstoreUiService.buildBorrowerFilter(),
                    'Borrowers', bookstoreUiService.buildBorrowerTable(), {
                    action 'Create a Borrower', ActionIcon.ADD, this.&editBorrower as MethodClosure, true
                }
            }
        }
        taackUiSimpleService.show(b, bookstoreUiService.buildMenu())
    }

    def selectBorrower() {
        def b = new UiBlockSpecifier().ui {
            modal {
                ajaxBlock 'borrowers', {
                    tableFilter 'Filter', bookstoreUiService.buildBorrowerFilter(),
                            'Borrowers', bookstoreUiService.buildBorrowerTable(true), {
                        action 'Create a Borrower', ActionIcon.ADD, this.&editBorrower as MethodClosure, true
                    }
                }
            }
        }
        taackUiSimpleService.show(b)
    }

    def editAuthor(BookstoreAuthor author) {
        author ?= new BookstoreAuthor()
        def b = new UiBlockSpecifier().ui {
            modal {
                ajaxBlock 'editAuthor', {
                    form 'Author', bookstoreUiService.buildAuthorForm(author)
                }
            }
        }
        taackUiSimpleService.show(b)
    }

    def editBook(BookstoreBook book) {
        book ?= new BookstoreBook()
        def b = new UiBlockSpecifier().ui {
            modal {
                ajaxBlock 'editBook', {
                    form 'Book', bookstoreUiService.buildBookForm(book)
                }
            }
        }
        taackUiSimpleService.show(b)
    }

    def editBorrowedBook(BookstoreBorrowedBook borrowedBook) {
        borrowedBook ?= new BookstoreBorrowedBook()
        def bb = BookstoreBorrower.read(params.long('borrowerId'))
        def b = new UiBlockSpecifier().ui {
            modal {
                ajaxBlock 'editBook', {
                    form 'Borrowed Book', bookstoreUiService.buildBorrowedBookForm(borrowedBook, bb)
                }
            }
        }
        taackUiSimpleService.show(b)
    }

    def editShelf(BookstoreShelf shelf) {
        shelf ?= new BookstoreShelf()
        def b = new UiBlockSpecifier().ui {
            modal {
                ajaxBlock 'editBook', {
                    form 'Book', bookstoreUiService.buildShelfForm(shelf)
                }
            }
        }
        taackUiSimpleService.show(b)
    }

    def editBorrower(BookstoreBorrower borrower) {
        borrower ?= new BookstoreBorrower()
        def b = new UiBlockSpecifier().ui {
            modal {
                ajaxBlock 'editBorrower', {
                    form 'Borrower', bookstoreUiService.buildBorrowerForm(borrower)
                }
            }
        }
        taackUiSimpleService.show(b)
    }

    @Transactional
    def saveBorrowedBook() {
        taackSimpleSaveService.saveThenReloadOrRenderErrors(BookstoreBorrowedBook)
    }

    @Transactional
    def saveAuthor() {
        taackSimpleSaveService.saveThenReloadOrRenderErrors(BookstoreAuthor)
    }

    @Transactional
    def saveBorrower() {
        taackSimpleSaveService.saveThenReloadOrRenderErrors(BookstoreBorrower)
    }

    def selectAuthor() {
        def b = new UiBlockSpecifier().ui {
            modal {
                ajaxBlock 'selectAuthor', {
                    tableFilter 'Filter', bookstoreUiService.buildAuthorFilter(),
                            'Authors', bookstoreUiService.buildAuthorTable(true)
                }
            }
        }
        taackUiSimpleService.show(b)
    }

    def selectBook() {
        def b = new UiBlockSpecifier().ui {
            modal {
                ajaxBlock 'selectBook', {
                    tableFilter 'Filter', bookstoreUiService.buildBookFilter(),
                            'Books', bookstoreUiService.buildBookTable(true)
                }
            }
        }
        taackUiSimpleService.show(b)
    }

    def selectShelf() {
        def b = new UiBlockSpecifier().ui {
            modal {
                ajaxBlock 'selectShelf', {
                    tableFilter 'Filter', bookstoreUiService.buildShelfFilter(),
                            'Shelves', bookstoreUiService.buildShelfTable(true)
                }
            }
        }
        taackUiSimpleService.show(b)
    }

    @Transactional
    def saveBook() {
        taackSimpleSaveService.saveThenReloadOrRenderErrors(BookstoreBook)
    }

    @Transactional
    def saveShelf() {
        taackSimpleSaveService.saveThenReloadOrRenderErrors(BookstoreShelf)
    }

    def selectAuthorCloseModal(BookstoreAuthor author) {
        taackUiSimpleService.closeModal(author.id, author.toString())
    }

    def selectShelfCloseModal(BookstoreShelf shelf) {
        taackUiSimpleService.closeModal(shelf.id, shelf.toString())
    }

    def selectBookCloseModal(BookstoreBook book) {
        taackUiSimpleService.closeModal(book.id, book.toString())
    }
}
