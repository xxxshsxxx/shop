package ru.savshop.shop.repository;

        import org.springframework.data.jpa.repository.JpaRepository;
        import org.springframework.data.jpa.repository.Query;
        import org.springframework.data.repository.query.Param;
        import ru.savshop.shop.model.Picture;
        import ru.savshop.shop.model.Post;

        import java.util.List;

public interface PostRepository  extends JpaRepository<Post, Integer>{

       List<Post> findAllByUserId (int id);
       @Query("SELECT t FROM Post t WHERE LOWER(t.title) LIKE LOWER(CONCAT('%', :searchTerm, '%')) OR LOWER(t.description) " +
               "LIKE LOWER(CONCAT('%', :searchTerm, '%')) ORDER BY t.title ASC\n" + "  ")
       List<Post> findPostsByTitleLike(@Param("searchTerm") String find);

       List<Post> findPostsByCategoryId (int id);
       Post findPostsById(int id);

    Post findOneByPicturesId(Picture picture);
}
