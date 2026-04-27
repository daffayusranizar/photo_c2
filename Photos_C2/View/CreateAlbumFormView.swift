//
//  CreateAlbumFormView.swift
//  Photos_C2
//
//  Created by syafiq fii dzilaalin on 22/04/26.
//

import SwiftUI
import PhotosUI
import Contacts
import ContactsUI

struct CreateAlbumFormView: View {
    @Environment(GridViewModel.self) private var store
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [Image] = []
    @State private var albumName: String = ""
    @State private var isOn = false
    @State private var participants: [Participant] = []
    @State private var showContactPicker = false
    
    private let inviterCaption = "Invitation will be sent from Syafiq Fiidzilaalin (theonlyme234@gmail.com)."
    
    private let maxRotation: Double = 10
    private let maxOffset: CGFloat = 50
    private let maxSizeReduction: CGFloat = 45
    //    private let baseSize: CGFloat = 280
    private let baseSize: CGFloat = 270
    private let maxImages: Int = 5
    
    private var visibleImages: [Image] {
        Array(selectedImages.prefix(maxImages))
    }
    
    private var stackOrder: [Int] {
        let count = visibleImages.count
        guard count > 0 else { return [] }
        return Array((1..<count).reversed()) + [0]
    }
    
    private func cardStyle(for index: Int) -> (rotation: Double, xOffset: CGFloat, yOffset: CGFloat, size: CGFloat) {
        print("Index: \(index)")
        if index == 0 { return (0, 0, 0, baseSize) }
        let isRight = index % 2 == 1
        let count = visibleImages.count
        let sideDepth = (index + 1) / 2
        let maxSideDepth = isRight ? count / 2 : (count - 1) / 2
        guard maxSideDepth > 0 else { return (0, 0, 0, baseSize) }
        let scale = Double(sideDepth) / Double(maxSideDepth)
        let rotation = (isRight ? maxRotation : -maxRotation) * scale
        let xOffset = (isRight ? maxOffset : -maxOffset) * CGFloat(scale)
        let yOffset = -maxOffset/2.2 * CGFloat(scale)
        let size = baseSize - maxSizeReduction * CGFloat(scale)
        return (rotation, xOffset, yOffset, size)
    }
    
    /*
     cardStyle -> (rotation, xOffset, size)
     
     A = 1 + (2 / 2)
     B = 1 + 1
     C = 2
     
     */
    
    @ViewBuilder
    private var participantSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if participants.isEmpty {
                    Button {
                        showContactPicker = true
                    } label: {
                        Text("Add Participants")
                            .foregroundStyle(.blue)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                } else {
                    List {
                        ForEach(Array(participants.enumerated()), id: \.element.id) { index, participant in
                            ParticipantRow(participant: participant)
                                .overlay(alignment: .bottom) {
                                    if index < participants.count - 1 {
                                        Divider().padding(.leading, 56)
                                    }
                                }
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        participants.removeAll { $0.id == participant.id }
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                        Button {
                            showContactPicker = true
                        } label: {
                            Text("Add Participants")
                                .foregroundStyle(.blue)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                    }
                    .listStyle(.plain)
                    .scrollDisabled(true)
                    .scrollContentBackground(.hidden)
                    .frame(height: CGFloat(participants.count) * 64 + 56)
                }
            }
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Text(inviterCaption)
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.horizontal, 4)
        }
        .padding(.horizontal)
    }
    
    private struct ParticipantRow: View {
        let participant: Participant
        
        var body: some View {
            HStack(spacing: 12) {
                ZStack {
                    LinearGradient(
                        colors: [Color.blue, Color.purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    Text(initial)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(participant.name)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    if let subline {
                        Text(subline)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                Spacer()
            }
        }
        
        private var initial: String {
            String(participant.name.prefix(1)).uppercased()
        }
        
        private var subline: String? {
            participant.phone ?? participant.email
        }
    }
    
    @ViewBuilder
    private var thumbnailView: some View {
        VStack {
            //            Text("Jumlah foto: \(selectedImages.count)")
            //                .foregroundStyle(.red)
            if !selectedImages.isEmpty {
                ZStack(alignment: .bottom) {
                    ForEach(stackOrder, id: \.self) { index in
                        let style = cardStyle(for: index)
                        visibleImages[index]
                            .resizable()
                            .scaledToFill()
                            .frame(width: style.size, height: style.size)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
                            .rotationEffect(.degrees(style.rotation))
                            .offset(x: style.xOffset, y: style.yOffset)
                    }
                    
                    LinearGradient(
                        colors: [Color.black.opacity(0.6), Color.clear],
                        startPoint: .bottom,
                        endPoint: .center
                    )
                    .frame(width: 270, height: 300)
                    .cornerRadius(20)
                    
                    Text(albumName)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 28)
                        .frame(maxWidth: 300, alignment: .leading)
                }
            }
            else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray)
                    .frame(width: 300, height: 300)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing: 20){
                    thumbnailView
                    PhotosPicker(selection: $selectedItems, maxSelectionCount: 0, matching: .images) {
                        Text("Add Photos")
                    }
                    TextField("Album Name", text: $albumName)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.horizontal)
                    participantSection
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Toggle("Allow Adding Photos", isOn: $isOn)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .padding(.horizontal)
                    }
                }
            }
            .onChange(of: selectedItems) { oldValue, newValue in
                Task {
                    var newImages: [Image] = []
                    for item in newValue {
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            newImages.append(Image(uiImage: uiImage))
                        }
                    }
                    selectedImages = newImages
                }
            }
            .sheet(isPresented: $showContactPicker) {
                ContactPicker { picked in
                    for p in picked where !participants.contains(p) {
                        participants.append(p)
                    }
                }
            }
            .navigationTitle(Text("Create Album"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Create") {                        let mappedParticipants = participants.map { p in
                            ParticipantModel(
                                username: p.email ?? p.phone ?? p.name.lowercased().replacingOccurrences(of: " ", with: "."),
                                name: p.name,
                                profilePicture: ""
                            )
                        }
                        let mappedPhotos = selectedItems.indices.map { index in
                            PhotoModel(
                                fileName: "dummy_photo_\(index + 1)", // should be using real uploaded photos
                                fileExtension: "jpg",
                                fileSizeInMB: 0.0,
                                dateTime: Date(),
                                width: Int(baseSize),
                                height: Int(baseSize),
                                isReviewed: false
                            )
                        }

                        let newAlbum = AlbumModel(
                            albumName: albumName,
                            albumPhoto: "dummy_photo_1", // Default cover, should be obtained from the first photo uploaded
                            photos: mappedPhotos,
                            participants: mappedParticipants
                        )
                        
                        store.addAlbum(newAlbum)
                        dismiss()
                    }
                    .disabled(albumName.isEmpty)
                }
            }
        }
        .presentationDetents([.large])
    }
}

struct Participant: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let phone: String?
    let email: String?
    
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        lhs.name == rhs.name && lhs.phone == rhs.phone
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(phone)
    }
}

struct ContactPicker: UIViewControllerRepresentable {
    let onPick: ([Participant]) -> Void
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = context.coordinator
        picker.predicateForEnablingContact = NSPredicate(format: "phoneNumbers.@count > 0 OR emailAddresses.@count > 0")
        return picker
    }
    
    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onPick: onPick)
    }
    
    class Coordinator: NSObject, CNContactPickerDelegate {
        let onPick: ([Participant]) -> Void
        
        init(onPick: @escaping ([Participant]) -> Void) {
            self.onPick = onPick
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
            let mapped = contacts.compactMap { contact -> Participant? in
                let composedName = "\(contact.givenName) \(contact.familyName)"
                    .trimmingCharacters(in: .whitespaces)
                let phone = contact.phoneNumbers.first?.value.stringValue
                let email = contact.emailAddresses.first.map { $0.value as String }
                let displayName = composedName.isEmpty ? (phone ?? email ?? "") : composedName
                guard !displayName.isEmpty else { return nil }
                return Participant(name: displayName, phone: phone, email: email)
            }
            onPick(mapped)
        }
    }
}

#Preview {
    CreateAlbumFormView()
}
