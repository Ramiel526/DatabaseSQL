-- use JOIN to create produce table outputs
select bk.title, auth.authorName, bk.isbn, bk.year_pub, pub.pubName --origin.country_name
from books bk
join books_author bkA on bk.book_id = bkA.book_id
join authors auth on bkA.author_id = auth.author_id
join book_publisher bpub on bk.book_id = bpub.book_id
join publishers pub on bpub.pub_id = pub.pub_id;
--join countries origin on origin.country_id = pub.country_id;
