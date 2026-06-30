"use client";

import { useEffect, useState } from "react";
import { PerspectiveBook } from "@/components/perspective-book";

const BOOK_WIDTH = 124;
const BOOK_HEIGHT = 186;
const GRID_GAP = 24;
const BOOKS_PER_ROW = 3;

type Book = {
  title: string;
  author: string;
  coverSrc: string;
  coverClass: string;
  quotes?: string[];
};

const shelves: { label: string; books: Book[] }[] = [
  {
    label: "reading",
    books: [
      {
        title: "The Heart of Innovation",
        author: "Chanoff, Furst, Sabbah & Wegman",
        coverSrc: "/books/heart-of-innovation.jpg",
        coverClass: "bg-[#f1f0ed]",
      },
      {
        title: "The Story of Philosophy",
        author: "Will Durant",
        coverSrc: "/books/story-of-philosophy.jpg",
        coverClass: "bg-[#efe8d8]",
        quotes: [
          "Poor Aristotelian God!—he is a roi fainéant, a do-nothing king; “the king reigns, but he does not rule.” No wonder the British like Aristotle; his God is obviously copied from their king.",
        ],
      },
      {
        title: "Einstein: His Life and Universe",
        author: "Walter Isaacson",
        coverSrc: "/books/einstein.jpg",
        coverClass: "bg-[#c9bca3]",
        quotes: [
          "“In teaching history,” he replied, “there should be extensive discussion of personalities who benefited mankind through independence of character and judgment.” Einstein fits into that category.",
        ],
      },
    ],
  },
  {
    label: "read",
    books: [
      {
        title: "The Brothers Karamazov",
        author: "Fyodor Dostoevsky",
        coverSrc: "/books/brothers-karamazov.jpg",
        coverClass: "bg-[#4a5040]",
        quotes: [
          "You did not come down from the cross when they shouted to you, mocking and reviling you: “Come down from the cross and we will believe that it is you.” You did not come down because, again, you did not want to enslave man by a miracle and thirsted for faith that is free, not miraculous. You thirsted for love that is free, and not for the servile raptures of a slave before a power that has left him permanently terrified.",
        ],
      },
    ],
  },
];

// Below the `lg` breakpoint we cap each row to a single book so the floating
// caption always has room beside it.
function useBooksPerRow() {
  const [booksPerRow, setBooksPerRow] = useState(BOOKS_PER_ROW);

  useEffect(() => {
    const query = window.matchMedia("(min-width: 1024px)");
    const update = () => setBooksPerRow(query.matches ? BOOKS_PER_ROW : 1);
    update();
    query.addEventListener("change", update);
    return () => query.removeEventListener("change", update);
  }, []);

  return booksPerRow;
}

function Shelf({
  label,
  books,
  booksPerRow,
}: {
  label: string;
  books: Book[];
  booksPerRow: number;
}) {
  const [activeIndex, setActiveIndex] = useState<number | null>(null);
  const activeBook = activeIndex === null ? null : books[activeIndex];
  const activeRow = activeIndex === null ? 0 : Math.floor(activeIndex / booksPerRow);
  const columnCount = Math.min(books.length, booksPerRow);
  const booksInActiveRow =
    activeIndex === null
      ? columnCount
      : Math.min(booksPerRow, books.length - activeRow * booksPerRow);

  return (
    <section>
      <h2 className="text-sm mb-6 text-muted">{label}</h2>

      <ol
        className="relative grid"
        style={{
          gridTemplateColumns: `repeat(${columnCount}, ${BOOK_WIDTH}px)`,
          gap: `${GRID_GAP}px`,
        }}
      >
        {books.map((book, index) => (
          <li
            key={book.title}
            className="book-item relative z-10 transition-[filter,opacity,transform] duration-200 ease-out"
          >
            <div
              tabIndex={0}
              aria-label={`${book.title} by ${book.author}`}
              className="book-hitbox inline-flex outline-none"
              onFocus={() => setActiveIndex(index)}
              onBlur={() => setActiveIndex(null)}
              onMouseEnter={() => setActiveIndex(index)}
              onMouseLeave={() => setActiveIndex(null)}
            >
              <PerspectiveBook size="cover" className={book.coverClass}>
                <img
                  src={book.coverSrc}
                  alt={`${book.title} cover`}
                  className="absolute inset-0 h-full w-full object-cover"
                />
              </PerspectiveBook>
            </div>
          </li>
        ))}

        <div
          className={`pointer-events-none absolute z-50 max-h-[75vh] overflow-hidden transition-[opacity,transform] duration-200 ease-out ${
            activeBook?.quotes?.length ? "w-72" : "w-52"
          } ${activeBook ? "opacity-100" : "opacity-0"}`}
          style={{
            top: `${activeRow * (BOOK_HEIGHT + GRID_GAP) + BOOK_HEIGHT / 2}px`,
            left: `${booksInActiveRow * (BOOK_WIDTH + GRID_GAP)}px`,
            transform: `translateY(-50%) translateX(${activeBook ? "0" : "4px"})`,
          }}
        >
          {activeBook && (
            <>
              <p className="text-sm leading-snug text-fg">
                {activeBook.title}
              </p>
              {activeBook.author && (
                <p className="mt-1 text-xs text-muted">
                  {activeBook.author}
                </p>
              )}
              {activeBook.quotes && activeBook.quotes.length > 0 && (
                <div className="mt-3 flex flex-col gap-3 border-l border-muted/30 pl-3">
                  {activeBook.quotes.map((quote, i) => (
                    <p
                      key={i}
                      className="text-xs italic leading-relaxed text-muted"
                    >
                      {quote}
                    </p>
                  ))}
                </div>
              )}
            </>
          )}
        </div>
      </ol>
    </section>
  );
}

export default function Reading() {
  const booksPerRow = useBooksPerRow();

  return (
    <div className="w-full max-w-4xl py-8 font-mono text-sm">
      <p className="max-w-md text-sm leading-relaxed text-muted">
        books i have read from January 2026.
      </p>

      <div className="books-interaction mt-10 flex flex-col gap-12">
        {shelves.map((shelf) => (
          <Shelf
            key={shelf.label}
            label={shelf.label}
            books={shelf.books}
            booksPerRow={booksPerRow}
          />
        ))}
      </div>
    </div>
  );
}
