package com.web.pojo;

import lombok.Data;

@Data
public class Doctor {
    Integer id;
    Integer authority;
    String name;
    String office;
    String title;
    String introduction;
    String image;
    Integer communityId;
}
