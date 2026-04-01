"use client";

import {
  PerspectiveBook,
  BookTitle,
} from "@/components/perspective-book";
import {
  BookOpenText,
  Scales,
  Knife,
  WifiSlash,
  Fire,
  Columns,
  Cross,
  Terminal,
  Eye,
  Lightning,
  Flower,
  Sparkle,
  Snowflake,
  YinYang,
  FlowerLotus,
  Mountains,
  Sun,
  Planet,
  ShootingStar,
  StarFour,
  Path,
  Flask,
  Infinity,
  AirplaneTilt,
  Lightbulb,
  Handshake,
  Database,
  Feather,
  Skull,
  Compass,
  Atom,
  Graph,
  MathOperations,
  Boat,
  Function,
  Heart,
  ChatCircle,
  Sword,
  MapPin,
} from "@phosphor-icons/react";
import { ReactNode } from "react";

interface Book {
  title: string;
  author: string;
  className: string;
  icon: ReactNode;
}

const shelves: { label: string; books: Book[] }[] = [
  {
    label: "Currently reading",
    books: [
      {
        title: "The Heart of Innovation",
        author: "Chanoff, Furst, Wegman & Sabbah",
        className: "bg-[#8B2500] text-[#FFFCF0]",
        icon: <Lightbulb size={18} />,
      },
      {
        title: "The Brothers Karamazov",
        author: "Fyodor Dostoevsky",
        className: "bg-[#4a3728] text-[#FFFCF0]",
        icon: <Scales size={18} />,
      },
      {
        title: "The Story of Philosophy",
        author: "Will Durant",
        className: "bg-[#2B4162] text-[#FFFCF0]",
        icon: <Columns size={18} />,
      },
    ],
  },
  {
    label: "Have read",
    books: [
      {
        title: "Meditations",
        author: "Marcus Aurelius",
        className: "bg-[#4D4E41] text-[#e6c84a]",
        icon: <Columns size={18} />,
      },
      {
        title: "The Bible",
        author: "",
        className: "bg-[#1f3d2f] text-[#FFFCF0]",
        icon: <Cross size={18} />,
      },
      {
        title: "Fahrenheit 451",
        author: "Ray Bradbury",
        className: "bg-[#8B2500] text-[#FFFCF0]",
        icon: <Fire size={18} />,
      },
      {
        title: "The Myth of Sisyphus",
        author: "Albert Camus",
        className: "bg-[#5c4033] text-[#FFFCF0]",
        icon: <Mountains size={18} />,
      },
      {
        title: "The Stranger",
        author: "Albert Camus",
        className: "bg-[#4a3728] text-[#FFFCF0]",
        icon: <Sun size={18} />,
      },
      {
        title: "And Then There Were None",
        author: "Agatha Christie",
        className: "bg-[#2B2B2B] text-[#FFFCF0]",
        icon: <Knife size={18} />,
      },
      {
        title: "Algorithms",
        author: "Dasgupta, Papadimitriou & Vazirani",
        className: "bg-[#2B4162] text-[#FFFCF0]",
        icon: <Graph size={18} />,
      },
      {
        title: "The Mom Test",
        author: "Rob Fitzpatrick",
        className: "bg-[#2d4a3e] text-[#FFFCF0]",
        icon: <ChatCircle size={18} />,
      },
      {
        title: "One Hundred Years of Solitude",
        author: "Gabriel Garc\u00EDa M\u00E1rquez",
        className: "bg-[#4D4E41] text-[#e6c84a]",
        icon: <Sparkle size={18} />,
      },
      {
        title: "Is It Possible to Live This Way?",
        author: "Luigi Giussani",
        className: "bg-[#8B2500] text-[#FFFCF0]",
        icon: <Path size={18} />,
      },
      {
        title: "The Sun Also Rises",
        author: "Ernest Hemingway",
        className: "bg-[#4a3728] text-[#FFFCF0]",
        icon: <Sun size={18} />,
      },
      {
        title: "Brave New World",
        author: "Aldous Huxley",
        className: "bg-[#2d4a3e] text-[#FFFCF0]",
        icon: <Flask size={18} />,
      },
      {
        title: "Full Catastrophe Living",
        author: "Jon Kabat-Zinn",
        className: "bg-[#2d4a3e] text-[#FFFCF0]",
        icon: <FlowerLotus size={18} />,
      },
      {
        title: "Founding Sales",
        author: "Peter Kazanjy",
        className: "bg-[#2B4162] text-[#FFFCF0]",
        icon: <Handshake size={18} />,
      },
      {
        title: "There Are No Children Here",
        author: "Alex Kotlowitz",
        className: "bg-[#2B2B2B] text-[#FFFCF0]",
        icon: <MapPin size={18} />,
      },
      {
        title: "Mere Christianity",
        author: "C.S. Lewis",
        className: "bg-[#6B3A2A] text-[#FFFCF0]",
        icon: <StarFour size={18} />,
      },
      {
        title: "Spring Snow",
        author: "Yukio Mishima",
        className: "bg-[#3b3a57] text-[#FFFCF0]",
        icon: <Snowflake size={18} />,
      },
      {
        title: "Sula",
        author: "Toni Morrison",
        className: "bg-[#5c4033] text-[#FFFCF0]",
        icon: <Feather size={18} />,
      },
      {
        title: "Digital Minimalism",
        author: "Cal Newport",
        className: "bg-[#1a1a2e] text-[#c8c8d0]",
        icon: <WifiSlash size={18} />,
      },
      {
        title: "1984",
        author: "George Orwell",
        className: "bg-[#1a1a2e] text-[#c8c8d0]",
        icon: <Eye size={18} />,
      },
      {
        title: "Code",
        author: "Charles Petzold",
        className: "bg-[#3b3a57] text-[#FFFCF0]",
        icon: <Terminal size={18} />,
      },
      {
        title: "The War of Art",
        author: "Steven Pressfield",
        className: "bg-[#1a1a2e] text-[#c8c8d0]",
        icon: <Sword size={18} />,
      },
      {
        title: "Cosmos",
        author: "Carl Sagan",
        className: "bg-[#2B4162] text-[#FFFCF0]",
        icon: <ShootingStar size={18} />,
      },
      {
        title: "Frankenstein",
        author: "Mary Shelley",
        className: "bg-[#2d4a3e] text-[#FFFCF0]",
        icon: <Lightning size={18} />,
      },
      {
        title: "Multivariable Mathematics",
        author: "Theodore Shifrin",
        className: "bg-[#6B3A2A] text-[#FFFCF0]",
        icon: <MathOperations size={18} />,
      },
      {
        title: "The Grapes of Wrath",
        author: "John Steinbeck",
        className: "bg-[#6B3A2A] text-[#FFFCF0]",
        icon: <Flower size={18} />,
      },
      {
        title: "Adventures of Huckleberry Finn",
        author: "Mark Twain",
        className: "bg-[#4a3728] text-[#FFFCF0]",
        icon: <Boat size={18} />,
      },
      {
        title: "Infinite Jest",
        author: "David Foster Wallace",
        className: "bg-[#3b3a57] text-[#FFFCF0]",
        icon: <Infinity size={18} />,
      },
      {
        title: "The Book on the Taboo Against Knowing Who You Are",
        author: "Alan Watts",
        className: "bg-[#2B4162] text-[#FFFCF0]",
        icon: <YinYang size={18} />,
      },
      {
        title: "Generatingfunctionology",
        author: "Herbert Wilf",
        className: "bg-[#4D4E41] text-[#e6c84a]",
        icon: <Function size={18} />,
      },
      {
        title: "The Martian",
        author: "Andy Weir",
        className: "bg-[#8B3A2A] text-[#FFFCF0]",
        icon: <Planet size={18} />,
      },
    ],
  },
  {
    label: "Want to read",
    books: [
      {
        title: "Catch-22",
        author: "Joseph Heller",
        className: "bg-[#4D4E41] text-[#e6c84a]",
        icon: <AirplaneTilt size={18} />,
      },
      {
        title: "Dune",
        author: "Frank Herbert",
        className: "bg-[#4D4E41] text-[#e6c84a]",
        icon: <Planet size={18} />,
      },
      {
        title: "Einstein",
        author: "Walter Isaacson",
        className: "bg-[#4a3728] text-[#FFFCF0]",
        icon: <Atom size={18} />,
      },
      {
        title: "Purity of Heart Is to Will One Thing",
        author: "S\u00F8ren Kierkegaard",
        className: "bg-[#5c4033] text-[#FFFCF0]",
        icon: <Heart size={18} />,
      },
      {
        title: "Designing Data-Intensive Applications",
        author: "Martin Kleppmann",
        className: "bg-[#1a1a2e] text-[#c8c8d0]",
        icon: <Database size={18} />,
      },
      {
        title: "Blood Meridian",
        author: "Cormac McCarthy",
        className: "bg-[#2B2B2B] text-[#FFFCF0]",
        icon: <Skull size={18} />,
      },
      {
        title: "Lost in the Cosmos",
        author: "Walker Percy",
        className: "bg-[#3b3a57] text-[#FFFCF0]",
        icon: <Compass size={18} />,
      },
    ],
  },
];

export default function Reading() {
  return (
    <div className="w-full max-w-4xl py-8 font-mono text-sm">
      <div className="flex flex-col gap-12">
        {shelves.map((shelf) => (
          <section key={shelf.label}>
            <h2 className="text-sm mb-6">
              {shelf.label}
            </h2>
            <div className="flex flex-wrap gap-6">
              {shelf.books.map((book) => (
                <PerspectiveBook
                  key={book.title}
                  className={book.className}
                  textured
                  size="sm"
                >
                  <div className="flex flex-col h-full justify-between">
                    <div>
                      <BookTitle className="text-xs leading-snug break-words">
                        {book.title}
                      </BookTitle>
                      <span className="opacity-80 mt-1 block">{book.icon}</span>
                    </div>
                    {book.author && (
                      <p className="text-[10px] opacity-60">{book.author}</p>
                    )}
                  </div>
                </PerspectiveBook>
              ))}
            </div>
            <div className="mt-3 h-px bg-current opacity-[0.06]" />
          </section>
        ))}
      </div>
    </div>
  );
}
