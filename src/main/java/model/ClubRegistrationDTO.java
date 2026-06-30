package model;

import java.time.LocalDate;

public class ClubRegistrationDTO {

    private int registrationId;
    private String studentCode;
    private String clubCode;
    private String clubName;
    private String membershipType;
    private String status;
    private LocalDate registrationDate;

    public ClubRegistrationDTO(int registrationId, String studentCode, String clubCode, String clubName, String membershipType, String status, LocalDate registrationDate) {
        this.registrationId = registrationId;
        this.studentCode = studentCode;
        this.clubCode = clubCode;
        this.clubName = clubName;
        this.membershipType = membershipType;
        this.status = status;
        this.registrationDate = registrationDate;
    }

    public int getRegistrationId() {
        return registrationId;
    }

    public String getStudentCode() {
        return studentCode;
    }

    public String getClubCode() {
        return clubCode;
    }

    public String getClubName() {
        return clubName;
    }

    public String getMembershipType() {
        return membershipType;
    }

    public String getStatus() {
        return status;
    }

    public LocalDate getRegistrationDate() {
        return registrationDate;
    }
}
