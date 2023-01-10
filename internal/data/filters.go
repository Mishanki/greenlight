package data

import "greenlight/internal/validator"

type Filters struct {
	Page         int
	PageSize     int
	Sort         string
	SortSafelist []string
}

func ValidateFilters(v *validator.Validator, f Filters) {
	v.Check(f.Page > 0, "page", "Must be greater than zero")
	v.Check(f.Page <= 10_000_000, "page", "Must be a maximum of 10 million")
	v.Check(f.PageSize > 0, "page_size", "Must be greater than zero")
	v.Check(f.PageSize <= 100, "page_size", "Must be a maximum of 100")

	v.Check(validator.In(f.Sort, f.SortSafelist...), "sort", "Invalid sort value")
}
