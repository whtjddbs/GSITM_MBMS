package com.gsitm.mbms.building;

/**
 * @작성일 : 2019. 5. 23.
 * @작성자 : 김원빈
 */
public class BuildingDTO {
   int buildNo;
   String buildName;
   String buildAddr;
   String buildPost;
   
   public BuildingDTO() {
      super();
   }
   
   public BuildingDTO(int buildNo, String buildName, String buildAddr, String buildPost) {
      super();
      this.buildNo = buildNo;
      this.buildName = buildName;
      this.buildAddr = buildAddr;
      this.buildPost = buildPost;
   }
   
   public int getBuildNo() {
      return buildNo;
   }
   public void setBuildNo(int buildNo) {
      this.buildNo = buildNo;
   }
   public String getBuildName() {
      return buildName;
   }
   public void setBuildName(String buildName) {
      this.buildName = buildName;
   }
   public String getBuildAddr() {
      return buildAddr;
   }
   public void setBuildAddr(String buildAddr) {
      this.buildAddr = buildAddr;
   }
   public String getBuildPost() {
      return buildPost;
   }
   public void setBuildPost(String buildPost) {
      this.buildPost = buildPost;
   }
   @Override
   public String toString() {
      return "BuildingDTO [buildNo=" + buildNo + ", buildName=" + buildName + ", buildAddr=" + buildAddr
            + ", buildPost=" + buildPost + "]";
   }
}