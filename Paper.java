import java.sql.*;

public class Paper {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/conference_review";

    static final String USER = "root";
    static final String PASS = "password";

    public void getPaperDetails(String authorEmail) {
        Connection conn = null;
        Statement stmt = null;
        int count = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("\nConnecting to the database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Creating stamement...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT Paper.Id, Paper.Title, Paper.Abstract, Author.EmailAddr, Author.FirstName, Author.LastName FROM AUTHOR INNER JOIN PAPER ON Author.EmailAddr = Paper.AuthorId";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Integer paperId = rs.getInt("Paper.Id");
                String paperTitle = rs.getString("Paper.Title");
                String paperAbs = rs.getString("Paper.Abstract");
                String authorId = rs.getString("Author.EmailAddr");
                String fName = rs.getString("Author.FirstName");
                String lName = rs.getString("Author.LastName");

                if (authorId.equals(authorEmail)) {
                    System.out.print("Paper_ID: " + paperId);
                    System.out.print(", Paper_Title: " + paperTitle);
                    System.out.print(", Paper_Abstract: " + paperAbs);
                    System.out.print(", Author_ID: " + authorId);
                    System.out.print(", Author_fName: " + fName);
                    System.out.println(", Author_lName: " + lName);
                    count++;
                }
            }
            if (count == 0) {
                System.out.println("NOT FOUND!");
            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {

            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }

        }
    }

    public void getReview(int PaperId) {
        Connection conn = null;
        Statement stmt = null;
        int count = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("\nConnecting to the database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Creating stamement...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT Id, Recommendation, MeritScore, PaperId, ReadabilityScore, ReviewerId, OriginalityScore, RelevanceScore FROM REVIEW";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Integer reviewId = rs.getInt("Id");
                String recommend = rs.getString("Recommendation");
                Integer meritScore = rs.getInt("MeritScore");
                Integer paperId = rs.getInt("PaperId");
                Integer readScore = rs.getInt("ReadabilityScore");
                String reviewerId = rs.getString("ReviewerId");
                Integer originScore = rs.getInt("OriginalityScore");
                Integer relevScore = rs.getInt("RelevanceScore");


                if (reviewId == PaperId) {
                    System.out.print("Review_ID: " + reviewId);
                    System.out.print(", Recommendation: " + recommend);
                    System.out.print(", Merit_Score: " + meritScore);
                    System.out.print(", Paper_ID: " + paperId);
                    System.out.print(", Readability_Score: " + readScore);
                    System.out.print(", Reviewer_ID: " + reviewerId);
                    System.out.print(", Originality_Score: " + originScore);
                    System.out.println(", Relevance_Score: " + relevScore);
                    count++;
                }
            }
            if (count == 0) {
                System.out.println("REVIEW NOT FOUND!");
            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {

            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }

        }
    }

    public void countPaper() {
        int count = 0;
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("\nConnecting to the database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT COUNT(Id) FROM PAPER";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt(1);
            }
            System.out.println("Number of papers submitted: " + count);


            rs.close();
            stmt.close();
            conn.close();

        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {

            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }

        }
    }

    public void addPaper(String paperName, String abs, String fileName, String authorFname, String authorLname, String authorEmail){
        Connection conn = null;
        Statement stmt = null;
        int count = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("\nConnecting to the database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected database successfully...");
            System.out.println("Inserting records into a table...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT Author.EmailAddr FROM AUTHOR";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                String authorId = rs.getString("Author.EmailAddr");

                if (authorId.equals(authorEmail)){
                    count++;
                }
                if (count > 0){
                    String sqlTwo = "INSERT INTO PAPER (Title, Abstract, FileName,AuthorId) VALUES ('" +paperName+ "', '" +abs+ "', '" +fileName+ "', '" +authorEmail+ "')";
                    stmt.executeUpdate(sqlTwo);
                    System.out.println("Inserted records into the table...");
                    break;
                }
                else if (count == 0){
                        String newAuthor = "INSERT INTO AUTHOR (EmailAddr, FirstName, LastName) VALUES ('" +authorEmail+ "', '" +authorFname+ "', '" +authorLname+ "')";
                        stmt.executeUpdate(newAuthor);
                        System.out.println("Created new author: " +authorLname+ " " +authorFname);
                        String insertRec = "INSERT INTO PAPER (Title, Abstract, FileName,AuthorId) VALUES ('" +paperName+ "', '" +abs+ "', '" +fileName+ "', '" +authorEmail+ "')";
                        stmt.executeUpdate(insertRec);
                        System.out.println("Successfully inserted a record!");
                        break;

                }
                rs.close();
                stmt.close();
                conn.close();
            }



        }
        catch(SQLException se){
            se.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(stmt!=null)
                    conn.close();
            }catch(SQLException se) {
            }
            try{
                if(conn!=null)
                    conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }


    }

    public void deleteAuthor (String authorEmail){
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("\nConnecting to the database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected database successfully...");
            System.out.println("Inserting records into a table...");
            PreparedStatement st = conn.prepareStatement("DELETE FROM AUTHOR WHERE EmailAddr = ?");
            st.setString(1,authorEmail);
            st.executeUpdate();
            System.out.println("Deleting record from the table...");
            st.close();
        }
        catch(Exception e){
            System.out.println("\nERROR: " + e);
            System.out.println("The record cannot be deleted because it violates referential integrity constraint!");

        }

    }

}

