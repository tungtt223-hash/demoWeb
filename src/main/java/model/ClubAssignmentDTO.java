package model;

import java.time.LocalDate;

public class ClubAssignmentDTO {

    private String clubCode;
    private String clubName;
    private String advisorCode;
    private String advisorName;
    private LocalDate assignmentDate;

    public ClubAssignmentDTO(String clubCode, String clubName, String advisorCode, String advisorName, LocalDate assignmentDate) {
        this.clubCode = clubCode;
        this.clubName = clubName;
        this.advisorCode = advisorCode;
        this.advisorName = advisorName;
        this.assignmentDate = assignmentDate;
    }

    public String getClubCode() {
        return clubCode;
    }

    public String getClubName() {
        return clubName;
    }

    public String getAdvisorCode() {
        return advisorCode;
    }

    public String getAdvisorName() {
        return advisorName;
    }

    public LocalDate getAssignmentDate() {
        return assignmentDate;
    }
}
