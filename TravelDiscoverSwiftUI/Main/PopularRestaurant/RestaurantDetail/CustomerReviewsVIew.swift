//
//  CustomerReviewsVIew.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 13/5/24.
//

import SwiftUI
import Kingfisher

struct CustomerReviewsVIew: View {
    let reviews: [Review]
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Text("Customer Reviews")
                .font(.system(size: 18, weight: .bold))
            Spacer()
        }//: HSTACK
        .padding(.horizontal)
        .padding(.top)
            ForEach(reviews, id: \.self){ review in
                VStack(alignment: .leading){
                    HStack{
                        KFImage(URL(string: review.user.profileImage))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44)
                            .cornerRadius(.infinity)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(review.user.firstName) \(review.user.lastName)")
                                .font(.system(size: 14, weight: .bold))
                            
                            HStack(spacing: 4) {
                                ForEach(0..<review.rating, id: \.self) { num in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.orange)
                                }//: LOOP
                                ForEach(0..<5 - review.rating, id: \.self) { num in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.gray)
                                }//: LOOP
                            }//: HSTACK
                            .font(.system(size: 12))
                        }//: VSTACK
                        Spacer()
                        Text(randomDateString(for: review))
                            .font(.system(size: 14, weight: .bold))
                    }//: HSTACK
                    Text(review.text)
                }//: VSTACK
                .padding(.top, 4)
                .padding(.horizontal)
            }//: LOOP
    }
    //MARK: - RANDOM GENERATING DATE FUNCTION
    func randomDateString(for review: Review) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        
        let year = Int(arc4random_uniform(5)) + 2020 + review.user.id
        
        let month = Int(arc4random_uniform(12)) + 1
        
        let calendar = Calendar.current
        let components = DateComponents(year: year, month: month)
        guard let startDate = calendar.date(from: components),
              let endDate = calendar.date(byAdding: .month, value: 1, to: startDate) else {
            return ""
        }
        let randomDate = Date(timeIntervalSinceReferenceDate: TimeInterval.random(in: startDate.timeIntervalSinceReferenceDate..<endDate.timeIntervalSinceReferenceDate))
        
        let dateString = dateFormatter.string(from: randomDate)
        
        print("Generated date for review \(review.user.firstName) \(review.user.lastName): \(dateString)")
        
        return dateString
    }


}

//MARK: - PREVIEW
#Preview {
    CustomerReviewsVIew(reviews: .init())
}
