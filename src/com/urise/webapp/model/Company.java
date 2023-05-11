package com.urise.webapp.model;

import com.urise.webapp.util.LocalDateXmlAdapter;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@XmlAccessorType(XmlAccessType.FIELD)
public class Company implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    private List<Period> periods;
    private String name;
    private String website = "";

    public Company(String name, List<Period> periods) {
        this.name = name;
        this.periods = periods;
    }

    public Company() {
    }

    public List<Period> getPeriods() {
        return periods;
    }

    public String getName() {
        return name;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Company company = (Company) o;
        return Objects.equals(periods, company.periods) && Objects.equals(name, company.name) && Objects.equals(website, company.website);
    }

    @Override
    public int hashCode() {
        return Objects.hash(periods, name, website);
    }

    @Override
    public String toString() {
        return "\nCompany: \n" + "{ periods: " + periods + " }\n" + "{ name: " + name + " }\n" + "{ website: " + website + " }";
    }

    @XmlAccessorType(XmlAccessType.FIELD)
    public static class Period implements Serializable {
        @Serial
        private static final long serialVersionUID = 1L;
        @XmlJavaTypeAdapter(LocalDateXmlAdapter.class)
        public LocalDate startDate;
        @XmlJavaTypeAdapter(LocalDateXmlAdapter.class)
        public LocalDate endDate;
        public String title;
        public String description;

        public Period() {
        }

        public Period(LocalDate startDate, LocalDate endDate, String title, String description) {
            this.startDate = startDate;
            this.endDate = endDate;
            this.title = title;
            this.description = description;
        }

        public LocalDate getStartDate() {
            return startDate;
        }

        public LocalDate getEndDate() {
            return endDate;
        }

        public String getTitle() {
            return title;
        }

        public String getDescription() {
            return description;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Period period = (Period) o;
            return Objects.equals(startDate, period.startDate) && Objects.equals(endDate, period.endDate) && Objects.equals(title, period.title) && Objects.equals(description, period.description);
        }

        @Override
        public int hashCode() {
            return Objects.hash(startDate, endDate, title, description);
        }

        @Override
        public String toString() {
            return "Period{" +
                    "startDate=" + startDate +
                    ", endDate=" + endDate +
                    ", title='" + title + '\'' +
                    ", description='" + description + '\'' +
                    '}';
        }
    }
}