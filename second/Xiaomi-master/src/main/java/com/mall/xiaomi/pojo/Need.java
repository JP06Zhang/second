package com.mall.xiaomi.pojo;

import lombok.Data;

import javax.persistence.*;

@Data
@Table(name = "`need`")
public class Need {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY,generator = "JDBC")
    private Integer id;
    private String needId;
    private String needName;
    private Integer userId;
    private Integer categoryId;

    @Column(name = "img_path")
    private String imgPath;
}
