package com.gph.model;

public class VideoType {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column video_type.type_id
     *
     * @mbggenerated
     */
    private Integer typeId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column video_type.typeName
     *
     * @mbggenerated
     */
    private String typename;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column video_type.type_id
     *
     * @return the value of video_type.type_id
     *
     * @mbggenerated
     */
    public Integer getTypeId() {
        return typeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column video_type.type_id
     *
     * @param typeId the value for video_type.type_id
     *
     * @mbggenerated
     */
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column video_type.typeName
     *
     * @return the value of video_type.typeName
     *
     * @mbggenerated
     */
    public String getTypename() {
        return typename;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column video_type.typeName
     *
     * @param typename the value for video_type.typeName
     *
     * @mbggenerated
     */
    public void setTypename(String typename) {
        this.typename = typename;
    }
}