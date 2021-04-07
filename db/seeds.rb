#Category Seed Info: Admin Edit Only
Category.find_or_create_by(name: "Song", definition: "A short poem or other set of words set to music or meant to be sung.")
Category.find_or_create_by(name: "Prose", definition: "Written or spoken language in its ordinary form, without metrical structure.")
Category.find_or_create_by(name: "Epic", definition: "A long poem, typically one derived from ancient oral tradition, narrating the deeds and adventures of heroic or legendary figures or the history of a nation.")
Category.find_or_create_by(name: "Poem", definition: "A piece of writing that partakes of the nature of both speech and song that is nearly always rhythmical, usually metaphorical, and often exhibits such formal elements as meter, rhyme, and stanzaic structure.")
Category.find_or_create_by(name: "Lyric", definition: "Expressing the writer's emotions, usually briefly and in stanzas or recognized forms.")
Category.find_or_create_by(name: "Autobiography", definition: "An account of a person's life written by that person.")
Category.find_or_create_by(name: "Biography", definition: "An account of someone's life written by someone else.")
Category.find_or_create_by(name: "Short Story", definition: "A story with a fully developed theme but significantly shorter and less elaborate than a novel.")
Category.find_or_create_by(name: "Novel", definition: "A ictitious prose narrative of book length, typically representing character and action with some degree of realism.")
Category.find_or_create_by(name: "Fable", definition: "A short story, typically with animals as characters, conveying a moral.")
Category.find_or_create_by(name: "Religious Text", definition: "Writing that is venerated for the worship of a deity")

Author.find_or_create_by(name: "John Donne", biography: "John Donne (/dʌn/ DUN; 22 January 1572[1] – 31 March 1631) was an English poet, scholar, soldier and secretary born into a recusant family, who later became a cleric in the Church of England.[3] Under royal patronage, he was made Dean of St Paul's Cathedral in London (1621–1631).[2] He is considered the preeminent representative of the metaphysical poets. His poetical works are noted for their metaphorical and sensual style and include sonnets, love poems, religious poems, Latin translations, epigrams, elegies, songs, and satires. He is also known for his sermons.")
Classic.find_or_create_by(author_id: 1, category_id: 2, title: "No Man Is An Island", content: "No man is an island,
    Entire of itself,
    Every man is a piece of the continent,
    A part of the main.
    If a clod be washed away by the sea,
    Europe is the less.
    As well as if a promontory were.
    As well as if a manor of thy friend’s
    Or of thine own were:
    Any man’s death diminishes me,
    Because I am involved in mankind,
    And therefore never send to know for whom the bell tolls;
    It tolls for thee.")
    Author.find_or_create_by(name: "Robert Frost", biography: "Robert Lee Frost (March 26, 1874 – January 29, 1963) was an American poet. His work was initially published in England before it was published in the United States. Known for his realistic depictions of rural life and his command of American colloquial speech,[2] Frost frequently wrote about settings from rural life in New England in the early 20th century, using them to examine complex social and philosophical themes.")
    Classic.find_or_create_by(title:"Stopping by Woods On a Snowy Evening", content: "Whose woods these are I think I know.
        His house is in the village though;
        He will not see me stopping here
        To watch his woods fill up with snow.
        My little horse must think it queer
        To stop without a farmhouse near
        Between the woods and frozen lake
        The darkest evening of the year.
        He gives his harness bells a shake
        To ask if there is some mistake.
        The only other sound’s the sweep
        Of easy wind and downy flake.
        The woods are lovely, dark and deep,
        But I have promises to keep,
        And miles to go before I sleep,
        And miles to go before I sleep.")
    Author.find_or_create_by(name: "Maya Angelou", biography: "Maya Angelou (/ˈændʒəloʊ/ (About this soundlisten) ANN-jəl-oh;[1][2] born Marguerite Annie Johnson; April 4, 1928 – May 28, 2014) was an American poet, memoirist, and civil rights activist. She published seven autobiographies, three books of essays, several books of poetry, and is credited with a list of plays, movies, and television shows spanning over 50 years. She received dozens of awards and more than 50 honorary degrees.[3] Angelou is best known for her series of seven autobiographies, which focus on her childhood and early adult experiences. The first, I Know Why the Caged Bird Sings (1969), tells of her life up to the age of 17 and brought her international recognition and acclaim.")
    Classic.find_or_create_by(title:"Still I Rise", content: "You may write me down in history
        With your bitter, twisted lies,
        You may tread me in the very dirt
        But still, like dust, I’ll rise.
        Does my sassiness upset you?
        Why are you beset with gloom?
        ’Cause I walk like I’ve got oil wells
        Pumping in my living room.
        Just like moons and like suns,
        With the certainty of tides,
        Just like hopes springing high,
        Still I’ll rise.
        Did you want to see me broken?
        Bowed head and lowered eyes?
        Shoulders falling down like teardrops.
        Weakened by my soulful cries.
        Does my haughtiness offend you?
        Don’t you take it awful hard
        ’Cause I laugh like I’ve got gold mines
        Diggin’ in my own back yard.
        You may shoot me with your words,
        You may cut me with your eyes,
        You may kill me with your hatefulness,
        But still, like air, I’ll rise.
        Does my sexiness upset you?
        Does it come as a surprise
        That I dance like I’ve got diamonds
        At the meeting of my thighs?
        Out of the huts of history’s shame
        I rise
        Up from a past that’s rooted in pain
        I rise
        I’m a black ocean, leaping and wide,
        Welling and swelling I bear in the tide.
        Leaving behind nights of terror and fear
        I rise
        Into a daybreak that’s wondrously clear
        I rise
        Bringing the gifts that my ancestors gave,
        I am the dream and the hope of the slave.
        I rise
        I rise
        I rise.")